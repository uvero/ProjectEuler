#How many such routes are there through a 20×20 grid?
require './common.rb'

class PathCulator
  def initialize
    @table = {}
  end

  def [] x,y
    return 1 if (x*y).zero?
    foo = @table[[x,y]]
    return foo if foo
    val = self[x,y-1] + self[x-1,y]
    @table[[x,y]] = val
    return val
  end
end

solve do
  PathCulator.new[20,20]
end