#Which starting number, under one million,
#produces the longest chain (by Collatz rule)?
#NOTE: Once the chain starts the terms are allowed to go above one million.

require './common.rb'

def collatz num
  num.even? ? num/2 : 3*num+1 
end

chain_length = Proc.new { |num|
  i = 1
  num, i = collatz(num), i+1 while num != 1
  i
}

LIM = 1_000_000

solve do
  (1..LIM).max_by(&chain_length)
end