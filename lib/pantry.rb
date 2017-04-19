require "./lib/recipe"
require "pry"

class Pantry
  attr_reader :stock, :shopping_list

  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, units)
    @stock[ingredient] += units
    # binding.pry
  end

  def add_to_shopping_list(recipe)
    @shopping_list.merge!(recipe.ingredients)

    # recipe.ingredients.each do |ingredient, units|
    #   # binding.pry
    #   if @shopping_list[ingredient] > 0
    #     @shopping_list[ingredient] = units
    #   end
    # end
  end

end
