# What is the largest prime factor of the number 600851475143 ?

require './common.rb'
require './primes_sieve.rb'

solve do
  NUM = 600851475143
  LIM = Math::sqrt(NUM).to_i
  sieve = PrimeSieve.new(LIM)
  (0..LIM).select{ |x| sieve[x] and NUM.%(x).zero? }.max
end