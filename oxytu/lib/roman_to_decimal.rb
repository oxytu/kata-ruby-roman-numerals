#!/usr/bin/ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'defs'

def valueof(c)
  $values[c]
end

def roman_to_dec(num)
  return if (num.to_i > MAX_DEC)
  arr = num.downcase.scan(/./u)
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
