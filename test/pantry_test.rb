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

    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_build_a_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    empty = {}

    assert_equal empty, r.ingredients

    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal  r.ingredients, {"Cheese" => 20, "Flour" => 20}

    pantry.add_to_shopping_list(r)
    assert_equal pantry.shopping_list, {"Cheese" => 20, "Flour" => 20}

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

    # assert_equal pantry.shopping_list, {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}
  end

end
