require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    class_name.constantize
  end

  def table_name
    # ...
    
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})

      @foreign_key = options[:foreign_key].nil? ? "#{name}_id".to_sym : options[:foreign_key]
      @class_name = options[:class_name].nil? ? "#{name}".camelcase : options[:class_name] 
      @primary_key = options[:primary_key].nil? ? :id : options[:primary_key]

    # ...
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})

    @foreign_key = options[:foreign_key].nil? ? "#{self_class_name.downcase}_id".to_sym : options[:foreign_key]
    @class_name = options[:class_name].nil? ? "#{name}".singularize.camelcase : options[:class_name] 
    @primary_key = options[:primary_key].nil? ? :id : options[:primary_key]
    # ...
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
   options = BelongsToOptions.new(name, options)
      define_method(name) do 
        
        primary_key = options.primary_key #<-- 'ID' name
        foreign_key = self.send(options.foreign_key) #<-- options.foreign_key = movies_id <-- self.movies_id from SQLOBJECT = value
        options.model_class.where(primary_key => foreign_key).first
          #model_class = Name object --> table_name = names
          # SELECT
          #   *
          # FROM
          #   table_name
          # WHERE
          #  primary_key = foreign_key

      end
      assoc_options[name] = options
    # ...
  end

  def has_many(name, options = {})
   options = HasManyOptions.new(name, self.name, options)

    define_method(name) do
        primary_key = self.send(options.primary_key)
        foreign_key = options.foreign_key
        options.model_class.where(foreign_key => primary_key)
    end
    # ...
  end

  def assoc_options
    @assoc_options ||= {}

    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
