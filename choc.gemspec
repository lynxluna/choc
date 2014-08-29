Gem::Specification.new do |s|
  s.name    = "choc"
  s.version = "0.1.0.alpha"
  s.date    = "2014-08-30"
  s.summary = "Chop your Cocoa libs"
  s.description = "Remove object files from your universal cocoa libs"
  s.authors = ["Didiet Noor"]
  s.email   = "lynxluna@gmail.com"
  s.files   = ["lib/choc_tools.rb", "bin/choc"]
  s.homepage = "http://github.com/lynxluna/choc"
  s.license = "MIT"
  s.add_runtime_dependency "uuid", ["~>0"]
  s.executables << 'choc'
end
