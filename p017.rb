require './common.rb'

class Fixnum
  @@dict = {
    1 => "one", 2 => "two", 3 => "three", 4 => "four",
    5 => "five", 6 => "six", 7 => "seven", 8 => "eight",
    9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
    13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
    17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty",
    30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty",
    70 => "seventy", 80 => "eighty", 90 => "ninety",
    1000 => "one thousand"
  }

  def to_english
    @@dict[self].tap{|x| return x if x }
    hunds, tens, ones = self/100, self%100/10, self%10
    tens_and_ones = self%100
    if hunds.zero?
      return "#{(tens*10).to_english}-#{ones.to_english}"
    elsif tens_and_ones.zero?
      return "#{hunds.to_english} hundred"
    else
      return "#{hunds.to_english} hundred and #{(tens_and_ones).to_english}"
    end
  end
end

solve do
  (1..1000).map{ |num| num.to_english.delete(" -").length}.sum
end
