require 'connection_adapter'

class User
  @@connection = SqliteAdapter.new # Class method adapter

  def initialize(attributes)
    @attributes = attributes
  end

  def id
    @attributes[:id]
  end

  def name
    @attributes[:name]
  end

  def self.find(id)
    find_by_sql("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
  end

  def self.all
    find_by_sql("SELECT * FROM users")
  end

  def self.find_by_sql(sql)
    rows = @@connection.execute(sql) #[id, name]
    rows.map do |row| # [id, name]
      attributes = map_values_to_columns(row)
      new(attributes)
    end
  end

  def self.map_values_to_columns(values)
    Hash[columns.zip(values)]
  end

  def self.columns
    @@connection.columns("users")
  end
end