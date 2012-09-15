#!/usr/bin/ruby

def valueof(c)
  { :m => 1000, :d => 500, :c => 100, :l => 50, :x => 10, :v => 5, :i => 1 }[c.to_sym]
end

def roman_to_dec(num)
  puts num
  arr = num.downcase.scan(/./)
  value = 0

  arr.count.times do |i|
    if (i+1 < arr.count && valueof(arr[i+1]) > valueof(arr[i]))
      value -= valueof(arr[i])
    else
      value += valueof(arr[i])
    end
  end
  
  value
end

if __FILE__==$0
  puts roman_to_dec(ARGV[0].downcase)
end
