require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection::execute2("SELECT * FROM #{table_name}").first
    
    @columns.map {|col| col.to_sym}
    # ...
  end

  def self.finalize!
    columns.each do |col|
      define_method("#{col}") do
        attributes["#{col}".to_sym]
      end

      define_method("#{col}=") do |value|
        attributes["#{col}".to_sym] = value 
      end 

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    # @table_name = DBconnection
    @table_name ||= self.name.tableize
    # ...
  end

  def self.all
    results = DBConnection::execute("SELECT * FROM #{table_name}")
    parse_all(results)
    # ...
  end

  def self.parse_all(results)
    results.map do |data|
      self.new(data)
    end
    # ...
  end

  def self.find(id)
    all.find { |obj| obj.id == id}
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
    self.class.columns.map do |col|
      self.send(col)
    end

  end

  def insert
    # ...
    col_names = self.class.columns.join(',')
    question_marks = (["?"] * self.attribute_values.length).join(',')

    DBConnection::execute(<<-SQL, *attribute_values)
        INSERT INTO
          #{self.class.table_name} (#{col_names})
        VALUES
          (#{question_marks})
      SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set_line = self.class.columns.map {|attr_name| "#{attr_name} = ?"}.join(',')
    object_id = self.id 

     DBConnection::execute(<<-SQL, *attribute_values, object_id)
        UPDATE
          #{self.class.table_name}
        SET
          #{set_line}
        WHERE
          id = ?
      SQL

  end

  def save
    # ...
    if self.id.nil?
      insert
    else
      update
    end
  end
end
