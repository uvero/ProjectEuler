#Find the sum of all the primes below two million.
require './common.rb'
require './primes_sieve.rb'
solve do 
  LIM = 2_000_000
  sieve = PrimeSieve.new(LIM)
  (0..LIM).select{ |x| sieve[x] }.sum
end