#!/usr/bin/ruby

num = ARGV[0].to_i

$values = { :m => 1000, :d => 500, :c => 100, :l => 50, :x => 10, :v => 5, :i => 1 }

def reverse_valueof(c)
  $values.invert[c].to_s
end

def get_highest_value
  $values.invert.keys.max
end

def get_minimum_value_exceeding(val)
  sorted = $values.invert.keys.sort
  min = 0
  idx = 0
  while min < val
    min = sorted[idx]
    idx += 1
  end
  #puts "get_minimum_value_exceeding(#{val}) = #{sorted[idx-1]}"
  sorted[idx-1]
end

def delete_highest_value 
  $values.delete($values.invert[get_highest_value])
end

def stack_dump(stack)
  rv = stack.reverse.map{ |e| e.to_s }.join
  stack.clear
  return rv
end

def dec_to_roman(num)
  stack = []
  value = ""

  value += reverse_valueof(get_highest_value) * (num / get_highest_value)
  num -= get_highest_value * (num / get_highest_value)
  lastnum = 0

  while !(num >= 0 && num <= 3)
    #puts "Stepping: Output: #{value}, Remainder: #{num}, Stack: #{stack.inspect}"
    if (num < 0)
      minex = get_minimum_value_exceeding(-num)
      stack << reverse_valueof(minex)
      lastnum = num
      num += minex
    else
      if (lastnum < 0)
        #puts "Stack dump: #{stack.inspect}"
        value += stack_dump(stack)
        stack.clear
      end
      minex = get_minimum_value_exceeding(num)
      stack << reverse_valueof(minex)
      lastnum = num
      num -= minex
    end
  end
  value += stack_dump(stack)
  if (num <= 3)
    value += "i" * num
  end
  value
end

if __FILE__==$0
  puts dec_to_roman(num)
end
