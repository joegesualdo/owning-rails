require "connection_adapter"
require "active_model"

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def method_missing(name, *args)
      if self.class.columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)
      # rows = [{:id=>1, :name=>"Marc"}]
      rows.map do |row|
        new row
      end
    end

    def self.columns
      @@connection.columns(table_name)
    end

    def self.table_name
      name.downcase + "s"  # "users"
    end

    ## Relation
    class << self
      attr_accessor :current_scope
    end

    def self.all
      if current_scope
        current_scope.clone
      else
        Relation.new(self)
      end
    end

    def self.where(values)
      all.where(values)
    end

    def self.order(values)
      all.order(values)
    end

    def self.scope(name, body)
      define_singleton_method name, &body
    end
  end
end