Feature: Convert decimals to roman numerals

  This feature expects you to implement an instance method for the
  Integer class:

      class Integer
        def to_roman
          \# your code goes here...
        end
      end

  the method should return the roman numeral representation of any integer
  as follows:

      1.to_roman \#=> 'I'

  Scenario Outline: Convert decimals to roman numerals
    Given a decimal number <Decimal>
    Then it should be converted to the roman numeral '<Roman Numeral>'
    Examples:
      | Decimal | Roman Numeral |
      |       1 |             I |
