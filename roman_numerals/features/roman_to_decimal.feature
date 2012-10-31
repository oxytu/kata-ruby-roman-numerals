Feature: Convert roman numerals to decimals

  This feature expects you to enhance the *to_i* instance method of the
  String class:

      class String
        alias to_i_original to_i

        def to_i
          \# your code goes here...
        end
      end

  The method should return the decimal representation of any roman numeral
  as follows:

      'I'.to_i \#=> 1

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
      |     899 |            ICM |
      |     900 |             CM |
      |    1984 |      MCMLXXXIV |