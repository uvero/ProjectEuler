#Which starting number, under one million,
#produces the longest chain (by Collatz rule)?
#NOTE: Once the chain starts the terms are allowed to go above one million.

require './common.rb'

class CollatzCulator
  def CollatzCulator.collatz num
    num.even? ? num/2 : 3*num+1 
  end
  
  def initialize
    @table = Hash.new
    @table[1] = 1
  end
  
  def [] num
    r = @table[num]
    return r if r
    return 1 + self[CollatzCulator.collatz(num)].tap{|x| @table[num] = x }
  end
end


LIM = 1_000_000

finder = CollatzCulator.new()
solve do
  (1..LIM).max_by{|x| finder[x] }
end