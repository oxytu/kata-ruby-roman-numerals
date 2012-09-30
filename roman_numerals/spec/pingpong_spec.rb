require 'roman_to_dec'
require 'dec_to_roman'

describe "pingpong test" do
  it "should be a neutral function" do
    9999.times do |i|
      roman_to_dec(dec_to_roman(i+1)).should eql(i+1)
    end
  end
end
