# -*- encoding : utf-8 -*-
#!/usr/bin/ruby

require 'defs'

num = ARGV[0].to_i

$extended_values = {}

def build_extended_values
  $values.keys.each do |v|
    if ($values[v].to_s[0,1] == "1" && $values[v] < MAX_DEC)
      five_sym = $values.index($values[v] * 5)
      ten_sym = $values.index($values[v] * 10)
      $extended_values[$values[v]] = v.to_s
      $extended_values[$values[v] * 2] = v.to_s + v.to_s
      $extended_values[$values[v] * 3] = v.to_s + v.to_s + v.to_s
      $extended_values[$values[v] * 4] = v.to_s + five_sym.to_s
      $extended_values[$values[v] * 6] = five_sym.to_s + v.to_s
      $extended_values[$values[v] * 7] = five_sym.to_s + v.to_s + v.to_s
      $extended_values[$values[v] * 8] = five_sym.to_s + v.to_s + v.to_s + v.to_s
      $extended_values[$values[v] * 9] = v.to_s + ten_sym.to_s
    else
      $extended_values[$values[v]] = v.to_s
    end
  end
end

def dec_to_roman(num)
  build_extended_values

  result_string = ""
  factor = 10
  (0..Math.log10(num).floor).each do |p|
    lookup_part = num % factor
    if (lookup_part > 0)
      result_string = $extended_values[lookup_part] + result_string
      num -= (num % factor)
    end
    factor *= 10
  end

  result_string
end

if __FILE__==$0
  puts dec_to_roman(num)
end
