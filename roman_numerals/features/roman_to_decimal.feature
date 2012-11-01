# -*- encoding : utf-8 -*-
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
      | Roman Numeral | Decimal   |
      | I             |         1 |
      | II            |         2 |
      | III           |         3 |
      | IV            |         4 |
      | V             |         5 |
      | VI            |         6 |
      | VII           |         7 |
      | VIII          |         8 |
      | IX            |         9 |
      | X             |        10 |
      | XL            |        40 |
      | XC            |        90 |
      | CD            |       400 |
      | ICM           |       899 |
      | CM            |       900 |
      | MCMLXXXIV     |      1984 |
      | Mↁ            |      4000 |
      | ↂ             |     10000 |
