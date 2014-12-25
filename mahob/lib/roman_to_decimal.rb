# -*- encoding : utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), 'errors'))

class String
  ROMANS   = %w(I  V   X   L    C    D     M     ↁ     ↂ)
  DECIMALS =   [1, 5, 10, 50, 100, 500, 1000, 5000, 10000]
  ROMAN_REGEX = /[IVXLCDMↁↂ]+/i

  def roman_to_i
    if self =~ ROMAN_REGEX
      decimalize(self)
    else
      to_i_original
    end
  end

  private

  # XIV => [X, IV]
  def decimalize(string)
    indexes = string.chars.to_a.inject([]) do |indexes, c|
      index = ROMANS.index(c)
      indexes << index unless index.nil?
      indexes
    end

    if indexes.reverse.sort != indexes.reverse
      do_the_substraction_rule_stuff(indexes)
    else
      indexes.inject(0) do |n, i|
        n += DECIMALS[i]
        n
      end
    end
  end

  def do_the_substraction_rule_stuff(indexes)
    return 0 if indexes.size == 0
    i = 0
    decimal = 0
    while (indexes[i + 1] && indexes[i] < indexes[i + 1]) do
      decimal -= DECIMALS[indexes[i]]
      i += 1
    end
    decimal += DECIMALS[indexes[i]] + do_the_substraction_rule_stuff(indexes[i+1..indexes.size-1])
    decimal
  end
end

# Just to make oxytus RSpec examples pass
class Object
  def roman_to_dec(r)
    r.upcase.to_i
  end
end
