require_relative '03_associatable'
require 'byebug'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    # ...

    define_method(name) do 

      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      where_line = "#{through_options.table_name}.id = ?"

      joined = "#{source_options.table_name}.id = #{source_options.foreign_key}"

      # debugger
      all = DBConnection::execute(<<-SQL, self.send(through_options.foreign_key))
      SELECT
        #{source_options.table_name}.*
      FROM
        #{through_options.table_name}
      JOIN
        #{source_options.table_name} ON #{joined}
      WHERE
        #{where_line}
      SQL
 
      source_options.model_class.new(all.first)
    end
    
  end
end
