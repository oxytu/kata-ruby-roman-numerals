class RomanNumeralToDecimalTranslationError < Exception
  attr_accessor :roman_numeral
  def initialize(roman_numeral, msg)
    super(msg)
    @roman_numeral = roman_numeral
  end
end

class DecimalToRomanNumeralTranslationError < Exception
  attr_accessor :decimal
  def initialize(decimal, msg)
    super(msg)
    @decimal = decimal
  end
end