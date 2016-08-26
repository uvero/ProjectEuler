class PrimeSieve
  def initialize _size
    @size = _size
    @table = Hash.new(true) #each number has the right to be considered prime until proven composite
    @table[0], @table[1] = false, false #except 1, 0
    for i in (0..size)
      if @table[i]
        k = 2*i
        until k > size
          @table[k] = false
          k += i
        end
      end
    end
  end

  attr_reader :size

  def prime? arg
    #input-validity-check FTW
    raise "argument must be numeric" unless arg.kind_of? Numeric
    raise "argument must be whole" unless arg.whole?
    raise "number too large" if arg > size
    raise "number can not be negative" if arg < 0

    return @table[arg]
  end

  def range
    0..size
  end

  def primes
    range.select{ |x| self[x] }
  end

  alias :[] :prime?
  alias :to_a :primes
  alias :to_ary :to_a

  def PrimeSieve.compose(num)
    lim = Math::sqrt(num).to_i
    sieve = PrimeSieve.new(lim)
    [sieve, sieve.range.select{ |x| sieve[x] and num % x == 0 }]
  end
end