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
  when 0 raise "at least 1 argument required"
  when 1 return list.first
  when 2
    x, y = list
    return gcd_ext(x,y).first
  else
    return list.inject(list.max){ |total, current| total = gcd(total,current) }
  end
end

def lcm(*list)
  case list.length
   when 0 raise "at least 1 argument required"
   when 1 return list.first
   when 2
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
  res = block.call
  diff = Time.now - t
  puts "solution: #{res}\ntime: #{diff}"
end
alias :solve :solution

module Iterators
	def self.ints
		return enum_for(:ints) unless block_given?
		yield 0
		i = 1
		loop do
			yield i
			yield -i
			i += 1
		end
	end
end