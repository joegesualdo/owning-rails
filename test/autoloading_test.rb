require File.dirname(__FILE__) + '/test_helper'
require "autoloading"

class AutoloadingTest < Test::Unit::TestCase
  def test_return_const
    const = Object.const_missing(:ApplicationController)
    assert_equal ApplicationController, const
  end
end