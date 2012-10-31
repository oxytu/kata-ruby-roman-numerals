require 'decimal_to_roman'

describe "conversion" do
  it "converts decimal numbers to their roman correspondence" do
    dec_to_roman(1903).downcase.should eq("mcmiii")
    dec_to_roman(1904).downcase.should eq("mcmiv")
    dec_to_roman(501).downcase.should eq("di")
    dec_to_roman(499).downcase.should eq("cdxcix")
  end
end
