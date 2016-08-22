#A palindromic number reads the same both ways.
#The largest palindrome made from the product of
#two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

require './common.rb'

solve do
  TWO_DIGITS = 100...1000
  TWO_DIGITS.pairs(TWO_DIGITS){ |x,y| x*y }.select(&:pal?).max 
end