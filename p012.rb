#What is the value of the first triangle number to have over five hundred divisors?

require './common.rb'
require './primes_sieve.rb'

solve do
  i = 1
  t = 1
  while PrimeSieve.count_divisors(t) < 500
    i += 1
    t += i
  end
  t
end