require 'roman_to_dec'
require 'dec_to_roman'

describe "pingpong test" do
  it "should be a neutral function" do
    10000.times do |i|
      roman_to_dec(dec_to_roman(i)).should eql(i)
	end
  end
end