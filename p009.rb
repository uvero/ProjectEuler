#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.
require './common.rb'

solve do
  k = 0
  Iterators.pyth_including_non_primitive do |a,b,c|
    puts [a,b,c].inspect
    if a+b+c == 1000
      k = a*b*c
      break
    end
  end
  k
end