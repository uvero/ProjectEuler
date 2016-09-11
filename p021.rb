#Evaluate the sum of all the amicable numbers under 10000.

require './common.rb'
require './primes_sieve.rb'

def d n
  return 1 if n == 1
  PrimeSieve.divisors(n).inject(:+) - n
end

solve do
  LIM = 10_000
  sum = 0
  for i in 2...LIM
    di = d i
    next if di <= i
    ddi = d di
    sum += i+di if ddi == i
  end
  sum
end