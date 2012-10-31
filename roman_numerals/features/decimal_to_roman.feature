Feature: Convert decimals to roman numerals

  This feature expects you to implement an instance method for the
  Integer class:

      class Integer
        def to_roman
          \# your code goes here...
        end
      end

  The method should return the roman numeral representation of any integer
  as follows:

      1.to_roman \#=> 'I'

  Scenario: Raise a DecimalToRomanNumeralTransloationError when the given decimal
    number is larger then 10000
    Given a decimal number 10001
    Then a 'DecimalToRomanNumeralTranslationError' should be raised

  Scenario Outline: Convert decimals to roman numerals
    Given a decimal number <Decimal>
    Then it should be converted to the roman numeral '<Roman Numeral>'
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
      |      50 |              L |
      |      51 |             LI |
      |      52 |            LII |
      |      53 |           LIII |
      |      54 |            LIV |
      |      55 |             LV |
      |      56 |            LVI |
      |      57 |           LVII |
      |      58 |          LVIII |
      |      59 |            LIX |
      |      60 |             LX |
      |      90 |             XC |
      |     400 |             CD |
      |     500 |              D |
      |     555 |            DLV |
      |     900 |             CM |
      |    1000 |              M |
      |    2000 |             MM |
      |    3000 |            MMM |
      |    4000 |             Mↁ |
      |    1984 |      MCMLXXXIV |


