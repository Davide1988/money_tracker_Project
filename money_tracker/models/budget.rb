require_relative('../db/sql_runner.rb')
require_relative('../models/transaction')
require 'pry'


class Budget

  attr_reader :id
  attr_accessor :budget_amount

  def initialize(options)
    @budget_amount = options['budget_amount'].to_f.round(2)
    @id = options['id'].to_i if options['id']
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
    sql = "INSERT INTO budgets (budget_amount) VALUES ($1) RETURNING id"
    values = [@budget_amount]
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



end
