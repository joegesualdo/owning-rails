puts File.dirname(__FILE__) + "/test_helper"

require "./" + File.dirname(__FILE__) + "/test_helper"
require 'models/user'

class UserTest < Test::Unit::TestCase
  def test_initialize_with_attributes
    user = User.new(:id => 1, :name => "Marc")
    assert_equal 1, user.id
    assert_equal "Marc", user.name
  end

  def test_find
    user = User.find(1)
    assert_equal 1, user.id
  end

  def test_all
    user = User.all.first
    assert_equal 1, user.id
  end

  def test_map_values_to_columns
    values = [1, "Marc"]
    columns = [:id, :name]

    #attributes ={}
    #columns.each_with_index do |column , index|
    #  attributes[column] = values[index]
    #end

    # The next line is better than the above code
    attributes = Hash[columns.zip(values)]

    assert_equal({:id => 1, :name => "Marc" }, attributes)
  end

  def test_columns
    assert_equal [:id, :name], User.columns
  end

end