class PrimeSieve
  private def initialize _size
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

  public
  attr_reader :size

  def expand(num)
    return self if num <= size

    #mark numbers divided by already known primes
    for i in 2..size do
      next unless prime? i
      k = 2*i
      until k > num do
        @table[k] = false
        k += i
      end
    end

    #mark numbers divided by newly-known primes
    for i in (size..num)
      if @table[i]
        k = 2*i
        until k > num
          @table[k] = false
          k += i
        end
      end
    end

    @size = num
    self
  end

  def prime? arg
    #input-validity-check FTW
    raise "argument must be numeric" unless arg.kind_of? Numeric
    raise "argument must be whole" unless arg.%(1).zero?
    expand(arg+1) if arg > size
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

  def inspect
    "PrimeSieve[size: #{size}]"
  end
  
  alias :to_s :inspect
  
  #region static
  @@instance = PrimeSieve.new(3)

  def PrimeSieve.instance
    @@instance
  end

  def PrimeSieve.compose_without_exponents(num)
    return [num] if instance[num]
    lim = num/2
    instance.expand(lim)
    return (0..lim).select{ |x| instance[x] and num % x == 0 }
  end

  def PrimeSieve.compose(num)
    primes = PrimeSieve.compose_without_exponents(num)
    ret = []
    for p in primes
      k = 1
      k += 1 while num%(p**k) == 0
      ret << [p, k-1]
    end
    ret
  end

  def PrimeSieve.count_divisors(num)
    PrimeSieve.compose(num).map{|x,y| y+1}.inject(1) {|s,x| s *= x}
  end
end