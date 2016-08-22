#Find the difference between the sum of the squares of the
#first one hundred natural numbers and the square of the sum.

require './common.rb'
solve do
  RNG = 1..100
  (RNG.sum)**2 - RNG.map{|x| x**2}.sum 
end
