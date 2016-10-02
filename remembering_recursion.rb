class RememberingRecursion
  def initialize(starting_values, &method)
    @memory = Hash.new()
    starting_values.each{ |k,v| @memory[k] = v }
    @method = method
  end
  
  def [] index
    return @memory[index] if @memory.has_key? index
    calc = @method.call(index, Proc.new{ |ind| self[ind] })
    @memory[index] = calc
    return calc
  end
end
