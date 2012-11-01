# -*- encoding : utf-8 -*-
require 'roman_to_decimal'
require 'decimal_to_roman'

describe "pingpong test" do
  it "should be a neutral function" do
    9999.times do |i|
      r = dec_to_roman(i + 1)
      d = i + 1
      puts "#{r} == #{d} ?"
      roman_to_dec(r).should eql(d)
    end
  end
end
