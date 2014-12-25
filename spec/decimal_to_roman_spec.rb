# -*- encoding : utf-8 -*-
require 'decimal_to_roman'

describe "conversion" do
  it "converts decimal numbers to their roman correspondence" do
    expect(dec_to_roman(1903).downcase).to eq("mcmiii")
    expect(dec_to_roman(1904).downcase).to eq("mcmiv")
    expect(dec_to_roman(501).downcase).to eq("di")
    expect(dec_to_roman(499).downcase).to eq("cdxcix")
  end
end
