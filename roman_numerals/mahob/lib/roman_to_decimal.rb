#! /usr/bin/env ruby

class String
  ROMANS = %w(I V X L C D M ↁ ↂ)
  ROMAN_REGEX = /[IVXLCDMↁↂ]*/i
  
  def foo(char)
    if ROMANS.index(char) % 2 == 0 
      power = ROMANS.index(char) / 2
      puts "#{char} [#{ROMANS.index(char)}]: 10 ** #{power}"
      10 ** (power) 
    else
      power = ((ROMANS.index(char) - 1) / 2)
      puts "#{char} [#{ROMANS.index(char)}]: 5 * (10 ** #{power})"
      5 * (10 ** (power))
    end
  end
  
  def is_roman_numeral?
    puts "#{self} =~ /([M])*/i"
    if self =~ /([IVXLCDMↁↂ])*/i
      if self =~ /I{0,3}/i #&& self =~ /X{0,3}/i && self =~ /C{0,3}/i && self =~ /M{0,3}/i
          if self =~ /I{2}/i# && self =~ /L{2}/i self =~ /V{2}/i
            false
          end
          true
        else
          false
        end
      true
    else
      false
    end
  end
  
  def to_d
    raise "#{self} definitly ain't no roman numeral!" unless is_roman_numeral?
    i, n, romans = 0, 0, upcase.chars.to_a
    while (i < romans.size) do
      while ROMANS.index(romans[i + 1]) && ROMANS.index(romans[i]) <=  ROMANS.index(romans[i + 1]) do
        n -= foo(romans[i])
        i += 1
      end
      n += foo(romans[i])
      i += 1
    end
    n
  end
end

roman_numeral = ARGV[0]
begin
  puts "#{roman_numeral} => #{roman_numeral.to_d}"
rescue Exception => ex
  $stderr.puts ex
end
