#What is the millionth lexicographic permutation of the digits 0-9?
require './common.rb'

def permutation? arr
  arr.sort == arr.sort.uniq
end

solve do
  (0..9).to_a.permutation.map{|x| x.join("").to_i }[10**6 - 1]
end