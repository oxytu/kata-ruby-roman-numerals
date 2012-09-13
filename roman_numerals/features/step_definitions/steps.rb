module KnowsDecimalToRoman
  def set_decimal(value)
    @decimal = value.to_i
  end

  def decimal
    @decimal
  end

  def set_roman(value)
    @roman = value
  end

  def roman
    @roman
  end
end

World(KnowsDecimalToRoman)

Given /^a decimal number (\d+)$/ do |d|
  set_decimal(d)
end

Then /^it should be converted to the roman numeral '(\w+)'$/ do |r|
  set_roman(r)
  decimal.to_roman.should == roman
end

Then /^a '(\w+)' should be raised$/ do |exception_class_name|
  expect {
    decimal.to_roman
  }.to raise_exception(exception_class_name.constantize)
end