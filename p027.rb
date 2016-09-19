#Considering quadratics of the form:
#n2+an+b, where |a|<1000 and |b|≤1000
#Find the product of the coefficients, aa and bb,
#for the quadratic expression that produces
#the maximum number of primes for consecutive values of n, starting with n=0n=0.
require './common.rb'
require './primes_sieve.rb'

def prime? num
  PrimeSieve.instance[num]
end

RNG_A, RNG_B = (-999)...1000, (-999)..1000

score = lambda { |pair|
  a, b = *pair
  n = 0
  n += 1 while prime?((n**2 + a*n + b).abs)
  n
}


solve do
  RNG_A.pairs(RNG_B).max_by(&score).inject(:*)
end