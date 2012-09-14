Feature: Convert roman numerals to decimal numbers

  This feature expects you to implement an instance method for the
  String class:

      class String
        def parse_roman_numeral
          \# your code goes here...
        end
      end

  The method should return the numeral representation of any roman string
  as follows:

      "icm".parse_roman_numeral \#=> 899

  Scenario Outline: Convert roman numerals to decimals
    Given a roman numeral '<Roman Numeral>'
    Then it should be converted to the decimal <Decimal>
    Examples:
      | Decimal |  Roman Numeral |
      |       1 |              I |
      |       2 |             II |
      |       3 |            III |
      |       4 |             IV |
      |       5 |              V |
      |       6 |             VI |
      |       7 |            VII |
      |       8 |           VIII |
      |       9 |             IX |
      |      10 |              X |
      |      40 |             XL |
      |      90 |             XC |
      |     400 |             CD |
      |     900 |             CM |
      |    1984 |      MCMLXXXIV |
