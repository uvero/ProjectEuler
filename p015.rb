#How many such routes are there through a 20×20 grid?
require './common.rb'
require './remembering_recursion.rb'

solve do
  path_count = RememberingRecursion.new([0,0] => 1) { |pair, rec|
    x, y = *pair
    k = 1
    unless (x*y).zero?
      k = rec[[x,y-1]] + rec[[x-1,y]]
    end
    k
  }
  path_count[[20,20]]
end