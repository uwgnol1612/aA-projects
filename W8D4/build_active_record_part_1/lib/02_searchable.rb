require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'
module Searchable
  def where(params)
    # ...
    where_line = params.keys.map {|key| "#{key} = ?"}.join(" AND ")
    vals = params.values

    test = DBConnection::execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
      # debugger
      self.parse_all(test)
  end
  
end

class SQLObject
  extend Searchable
  # Mixin Searchable here...
end
