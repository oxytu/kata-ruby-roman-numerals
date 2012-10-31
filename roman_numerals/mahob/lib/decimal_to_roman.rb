require File.expand_path(File.join(File.dirname(__FILE__), 'errors'))

module DecimalToRoman

  ROMAN_NUMERALS              = %w(I  V   X   L    C    D     M     ↁ     ↂ)
  ROMAN_NUMERAL_VALUES        =   [1, 5, 10, 50, 100, 500, 1000, 5000, 10000]
  ROMAN_NUMERAL_VALUE_MAXIMUM = 10000

  def to_roman
    self.to_i.to_roman unless (self.class < Integer)
    raise DecimalToRomanNumeralTranslationError.new(self, "Too large") if self > ROMAN_NUMERAL_VALUE_MAXIMUM
    romanize(self)
  end

  private

  def romanize(value, power=4)
    return "" if power < 0 || value.nil? || value < 1
    n = value / 10 ** power
    translation =
      if n <= 3
        #puts "power = #{power}; n = #{n}"
        ROMAN_NUMERALS[2 * power] * n
      elsif n == 4
        ROMAN_NUMERALS[2 * power] + ROMAN_NUMERALS[2 * power + 1]
      elsif n == 5
        ROMAN_NUMERALS[2 * power + 1].dup
      elsif n > 5 && n <= 8
        ROMAN_NUMERALS[2 * power + 1] + ROMAN_NUMERALS[2 * power] * (n - 5)
      elsif n == 9
        ROMAN_NUMERALS[2 * power] + ROMAN_NUMERALS[2 * power + 2]
      else
        ""
      end

    translation << romanize(value - n * 10 ** power,  power - 1)
    translation
  end
end

class Numeric
  include DecimalToRoman
end

# Just to make oxytus RSpec examples pass
class Object
  def dec_to_roman(i)
    i.to_roman
  end
end
