# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mosaic/version'

Gem::Specification.new do |gem|
  gem.name          = "mosaic"
  gem.version       = Mosaic::VERSION
  gem.authors       = ["Adam \"Arcath\" Laycock"]
  gem.email         = ["gems@arcath.net"]
  gem.description   = %q{MOdular Sinatra ApplICation}
  gem.summary       = %q{Simple and extensible sinatra powered application framework}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "sinatra"
  
  gem.add_development_dependency "rspec"
end
