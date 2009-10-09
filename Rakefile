require 'lib/urlify'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "urlify"
    s.summary = "Convert accented characters to their ASCII equivalents"
    s.email = "benedict@eastaugh.net"
    s.homepage = "http://github.com/ionfish/urlify"
    s.description = "A small library for converting accented characters " +
                    "to their ASCII equivalents."
    s.authors = ["Benedict Eastaugh"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install " +
       "technicalpickles-jeweler -s http://gems.github.com"
end

task :default => :test

desc "Run the URLify test suite"
task :test do
  require 'test/unit'
  
  testdir = "test"
  Dir.foreach(testdir) do |f|
    path = "#{testdir}/#{f}"
    if File.ftype(path) == "file" && File.basename(f).match(/_test.rb$/)
      load path
    end
  end
end
