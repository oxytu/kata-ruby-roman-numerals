#!/usr/bin/ruby

MAHOB_MAX=10000

class DecimalToRomanNumeralTranslationError < Exception
  attr_accessor :decimal
  def initialize(decimal, msg)
    super(msg)
    @decimal = decimal
  end
end

module DecimalToRoman
  def to_roman
    if (self.to_i > MAHOB_MAX)
      raise DecimalToRomanNumeralTranslationError.new(self.to_i, "too large, maximum #{MAHOB_MAX}!")
    end
    dec_to_roman(self.to_i).upcase
  end
end

module RomanToDecimal
  def roman_to_i
    roman_to_dec(self.to_s.downcase)
  end
end

class Numeric
  include DecimalToRoman
end

class String
  include RomanToDecimal
end
