require_relative('../db/sql_runner.rb')
class Tag

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @type = options['type']
    @id = options['id'].to_i if options['id']
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find_all
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return tags = results.map {|tag| Tag.new(tag)}
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ($1) RETURNING id"
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def delete
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE tags SET type = $1 WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql,values)
  end



end
