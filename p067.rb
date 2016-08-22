#euler 67/18
#Find the maximum total from top to bottom in triangle.txt,
#a 15K text file containing a triangle with one-hundred rows.

require 'open-uri'
require './common.rb'

tree = open("https://projecteuler.net/project/resources/p067_triangle.txt").each_line.to_a
solve do
  tree.map!{|x| x.split(" ").map(&:to_i) }
  n = tree.length
  
  copy = Marshal.load Marshal.dump(tree) #a clone of tree
  
  (n-2).downto(0) do |k|
  	  (0..k).each do |m|
  	    copy[k][m] = tree[k][m] + ([copy[k+1][m], copy[k+1][m+1]].max)
  		end
  	end
  copy[0][0]
end