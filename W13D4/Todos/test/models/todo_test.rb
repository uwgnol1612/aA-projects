# == Schema Information
#
# Table name: todos
#
#  id                                                              :bigint           not null, primary key
#  title                                                           :string           not null
#  body                                                            :string           not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  done                                                            :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#

require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
