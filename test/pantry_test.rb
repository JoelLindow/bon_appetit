require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require "pry"

class PantryTest < Minitest::Test

def test_it_exists
  pantry = Pantry.new

  assert_instance_of Pantry, pantry
end

def test_it_can_check_stock
  pantry = Pantry.new
  empty = {}

  assert_equal  empty, pantry.stock
  assert_equal 0, pantry.stock_check("Cheese")
end

def test_it_can_add_stock
  pantry = Pantry.new
  pantry.restock("Cheese", 10)
  
  assert_equal 10, pantry.stock_check("Cheese")
end



end
