Feature: Convert roman numerals to decimal and vice versa

  Scenario: Convert decimal to roman and back to decimal
    Given decimals from 1 to 10000
    Then each value should be converted to a roman numeral and back to a decimal