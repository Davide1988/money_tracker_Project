require_relative('../db/sql_runner.rb')
require_relative('../models/merchant')
require_relative('../models/tag')
require 'date'
require 'pry'

class Transaction


  attr_reader :id
  attr_accessor :transaction_date, :amount, :merchant_id, :transaction_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = options['transaction_date']
    @amount = options['amount'].to_f.round(2)
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.find_all
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return transactions = results.map {|transaction| Transaction.new(transaction)}
  end


  def save()
    sql = "INSERT INTO transactions (transaction_date, amount, merchant_id, tag_id)
           VALUES ($1,$2,$3,$4) RETURNING id"
    values = [@transaction_date, @amount, @merchant_id, @tag_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end


  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE transactions SET (transaction_date, amount, merchant_id, tag_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@transaction_date, @amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    transaction = results.first
    return Transaction.new(transaction)
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run( sql, values )
    return Merchant.new( results.first )
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
  end






end
