# -*- encoding : utf-8 -*-
require 'roman_to_decimal'

describe "conversion" do
  it "converts roman numbers to their decimal correspondence" do
    roman_to_dec("mcmiii").should eq(1903)
    roman_to_dec("mcmiv").should eq(1904)
    roman_to_dec("di").should eq(501)
    roman_to_dec("id").should eq(499)
  end
end