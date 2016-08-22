class Numeric
	def whole?
		self%1 == 0
	end
end

module Enumerable
  def sum
    inject(0){|s,x| s += x}
  end
  
  def product
    inject(1){|s,x| s *= x}
  end
  
  def cross arr, &block
    block = lambda{|x,y| [x,y]} if block == nil
    map {|item| arr.map{|x| block[item,x] } }
  end
  
  def pairs arr, &block
    cross(arr,&block).flatten(1)
  end
  
  def take_while &block
    return Enumerator.new do |en|
      self.each do |item|
        break unless block[item]
        en << item
      end
    end
  end
end

class Fixnum
	def fact
	  (1..self).product
	end
	
	alias :'!' :fact
	
	def c k
	  fact / (k.! * (self-k).!)
	end
	
	def map &block
		return enum_for(:map) if block.nil?
		oldblock = nil
		if block.parameters.length.zero?
			oldblock = block
			block = lambda{|x| oldblock[]}
		end
		(0...self).map(&block)
	end
	
	def divby? a
		self.%(a).zero?
	end
	
	def divides? a
		a.divby? self
	end
	
	def palindrome?
	  str = to_s
	  str.reverse.eql?(str)
	end
	
	alias :pal? :palindrome?
	
	private
	def n
	  self
	end
end

def gcd_ext(a,b)
  return gcd_ext(b,a).tap{ |a| a[0],a[1] = a[1],a[0] } if a < b
  return a,1,0 if b.zero?
  q, r = a.divmod(b)
  gcd_var, x, y = gcd_ext(b,r)
  return gcd_var, y, x-q*y
end

def gcd(*list)
  case list.length
  when 0 then raise "at least 1 argument required"
  when 1 then return list.first
  when 2 then
    x, y = list
    return gcd_ext(x,y).first
  else
    return list.inject(list.max){ |total, current| total = gcd(total,current) }
  end
end

def lcm(*list)
  case list.length
   when 0 then raise "at least 1 argument required"
   when 1 then return list.first
   when 2 then
     x, y = list
     return (x*y)/(gcd_ext(x,y).first)
   else
     return list.inject(list.max){ |total, current| total = lcm(total,current) }
   end
end

def time &block
  t = Time.now
  block.call
  Time.now - t
end

def solution &block
  t = Time.now
  puts "Started #{t}"
  res = block.call
  diff = Time.now - t
  puts "solution: #{res}\ntime: #{diff}"
end
alias :solve :solution

module Iterators
	def Iterators.ints
		return enum_for(:ints) unless block_given?
		yield 0
		i = 1
		loop do
			yield i
			yield -i
			i += 1
		end
	end
	
	def Iterators.fib &block
	  return enum_for(:fib) if block.nil?
	  #syit: should yield indices too
	  case block.parameters.length
	  when 1 then syit = false
	  when 2 then syit = true
	  else raise "must have either 1 or 2 argument (f_n or f_n, n)"
	  end
	  yield 0,0
	  yield 1,1
	  prv, cur, ind = 1, 2, 2
	  loop do
  	  block[syit ? [cur, ind] : cur] 
  	  prv, cur, ind = cur, cur + prv, ind + 1
	  end
	end
end