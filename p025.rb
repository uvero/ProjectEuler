#What is the index of the first term in the
#Fibonacci sequence to contain 1000 digits?
require './common.rb'

solve do
  res = 0
  Iterators.fib do |fn,n|
    if fn.to_s.length >= 1000
      res = n
      break
    end
  end
  res
end