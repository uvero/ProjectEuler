#Using names.txt (right click and 'Save Link/Target As...'),
#a 46K text file containing over five-thousand first names,
#begin by sorting it into alphabetical order.
#Then working out the alphabetical value for each name,
#multiply this value by its alphabetical
#position in the list to obtain a name score.
#For example, when the list is sorted into alphabetical order,
#COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name
#in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#What is the total of all the name scores in the file?

require './common.rb'
require 'open-uri'

def score name
  name.split("").map{ |x| x.ord - 'A'.ord + 1 }.sum
end

list = open('https://projecteuler.net/project/resources/p022_names.txt')
              .read.delete('"').split(",")
              

solve do
  list.sort!
  sum = 0
  for i in 0...(list.length) do
    name = list[i]
    sum += (i+1) * score(name)
  end
  sum
end