require 'lib/urlify'

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
