# -*- encoding : utf-8 -*-
require 'roman_to_decimal'

describe "conversion" do
  it "converts roman numbers to their decimal correspondence" do
    expect(roman_to_dec("mcmiii")).to eq(1903)
    expect(roman_to_dec("mcmiv")).to eq(1904)
    expect(roman_to_dec("di")).to eq(501)
    expect(roman_to_dec("id")).to eq(499)
  end
end
