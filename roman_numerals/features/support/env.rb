require 'active_support/core_ext/string/inflections'

Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', '**'))).each do |file|
  puts "Requiring #{file}"
  require file
end
