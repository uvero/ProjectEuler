#Which starting number, under one million,
#produces the longest chain (by Collatz rule)?
#NOTE: Once the chain starts the terms are allowed to go above one million.

require './common.rb'
require './remembering_recursion.rb'

def nxt_collatz num
  num.even? ? num/2 : 3*num+1
end

LIM = 1_000_000
solve do
  chain_length = RememberingRecursion.new(1 => 0) { |n, rec|
   1 + rec[nxt_collatz(n)] 
  }
  (1..LIM).max_by{|x| chain_length[x] }
end