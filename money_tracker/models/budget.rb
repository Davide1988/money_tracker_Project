require_relative('../db/sql_runner.rb')
require_relative('../models/transaction')
require_relative('../models/tag')
require 'pry'


class Budget

  attr_reader :id
  attr_accessor :budget_amount, :tag_id

  def initialize(options)
    @budget_amount = options['budget_amount'].to_f.round(2)
    @id = options['id'].to_i if options['id']
    @tag_id = options['tag_id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.find_all
    sql = "SELECT * FROM budgets"
    results = SqlRunner.run(sql)
    return budget = results.map {|budget| Budget.new(budget)}
  end

  def save()
    sql = "INSERT INTO budgets (budget_amount, tag_id) VALUES ($1, $2) RETURNING id"
    values = [@budget_amount, @tag_id]
    result = SqlRunner.run(sql, values)
    @id =  result.first['id'].to_i
  end


  def delete
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE budgets SET budget_amount = $1 WHERE id = $2"
    values = [@budget_amount, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    budget = results.first
    return Budget.new(budget)
  end


  def self.sum_budgets()
    sql = "SELECT SUM(budget_amount) FROM budgets"
    results = SqlRunner.run(sql)
    return total = results.first['sum'].to_i
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
  end



end
