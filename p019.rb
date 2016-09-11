#You are given the following information, but you may prefer to
#do some research for yourself.
#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4,
#but not on a century unless it is divisible by 400.
#How many Sundays fell on the first of the month during the
#twentieth century (1 Jan 1901 to 31 Dec 2000)?

require './common.rb'

MONTHS = ([31] * 13).tap{ |arr|
  arr[0], arr[2], arr[4], arr[6], arr[9], arr[11] = nil, 28, 30, 30, 30, 30
}

def leap_year? y
  return true if y%400 == 0
  return false if y%100 == 0
  return true if y%4 == 0
  return false
end

def nxt_month month
  return 1 if month == 12
  return month+1
end

def nxt d, m, y
  if d == MONTHS[m]
    return [29,2,y] if m == 2 and leap_year? y
    y += 1 if m == 12
    return [1,nxt_month(m),y]
  end
  return [1,3,y] if m == 2 and d == 29
  return [d+1,m,y]
end

solve do
  d, m, y, wd = 1, 1, 1900, 2
  count = 0
  while y <= 2000 do
    count += 1 if d*wd == 1 and y > 1900
    d, m, y = nxt(d,m,y)
    wd += 1
    wd = 1 if wd == 8
    puts [d,m,y,wd].inspect
  end
  count
end