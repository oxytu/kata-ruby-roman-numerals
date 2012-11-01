# -*- encoding : utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), 'errors'))

class String
  ROMANS   = %w(I  V   X   L    C    D     M     ↁ     ↂ)
  DECIMALS =   [1, 5, 10, 50, 100, 500, 1000, 5000, 10000]
  ROMAN_REGEX = /[IVXLCDMↁↂ]+/i

  alias to_i_original to_i

  def to_i
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
      foobar(indexes)
    else
      indexes.inject(0) do |n, i|
        n += DECIMALS[i]
        n
      end
    end
  end

  def foobar(indexes)
    return 0 if indexes.size == 0
    i = 0
    #blocks = []
    #block = []
    decimal = 0
    while (indexes[i + 1] && indexes[i] < indexes[i + 1]) do
      decimal -= DECIMALS[indexes[i]]
      i += 1
    end
    decimal += DECIMALS[indexes[i]] + foobar(indexes[i+1..indexes.size-1])
    decimal
  end
  #def foo(char)
  #  if ROMANS.index(char) % 2 == 0
  #    power = ROMANS.index(char) / 2
  #    puts "#{char} [#{ROMANS.index(char)}]: 10 ** #{power}"
  #    10 ** (power)
  #  else
  #    power = ((ROMANS.index(char) - 1) / 2)
  #    puts "#{char} [#{ROMANS.index(char)}]: 5 * (10 ** #{power})"
  #    5 * (10 ** (power))
  #  end
  #end
  #
  #def is_roman_numeral?
  #  puts "#{self} =~ /([M])*/i"
  #  if self =~ /([IVXLCDMↁↂ])*/i
  #    if self =~ /I{0,3}/i #&& self =~ /X{0,3}/i && self =~ /C{0,3}/i && self =~ /M{0,3}/i
  #        if self =~ /I{2}/i# && self =~ /L{2}/i self =~ /V{2}/i
  #          false
  #        end
  #        true
  #      else
  #        false
  #      end
  #    true
  #  else
  #    false
  #  end
  #end
  #
  #def to_d
  #  raise "#{self} definitly ain't no roman numeral!" unless is_roman_numeral?
  #  i, n, romans = 0, 0, upcase.chars.to_a
  #  while (i < romans.size) do
  #    while ROMANS.index(romans[i + 1]) && ROMANS.index(romans[i]) <=  ROMANS.index(romans[i + 1]) do
  #      n -= foo(romans[i])
  #      i += 1
  #    end
  #    n += foo(romans[i])
  #    i += 1
  #  end
  #  n
  #end
end

# Just to make oxytus RSpec examples pass
class Object
  def roman_to_dec(r)
    r.upcase.to_i
  end
end
