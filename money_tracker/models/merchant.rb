require_relative('../db/sql_runner.rb')
class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1)"
    values = [@name]
    SqlRunner.run(sql, values)
  end





end
