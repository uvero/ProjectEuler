#What is the 10 001st prime number?
require './common.rb'
require './primes_sieve'
include Math

def rosser_theorem_upper_bound(n)
  ln_n = log(n)
  fp = n*(ln_n * log(ln_n))
  fp.to_i
end

LIM = 10_001

solve do
  bound = rosser_theorem_upper_bound(LIM)
  sieve = PrimeSieve.instance.expand(bound)
  sieve.primes[LIM - 1]
end
