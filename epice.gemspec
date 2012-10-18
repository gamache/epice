# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epice/version'

Gem::Specification.new do |gem|
  gem.name          = "epice"
  gem.version       = Epice::VERSION
  gem.authors       = ["pete gamache"]
  gem.email         = ["pete@gamache.org"]
  gem.description   = %q{Epice is a minimal wrapper for the SPICE circuit emulator.}
  gem.summary       = %q{Epice is a minimal wrapper for the SPICE circuit emulator.}
  gem.homepage      = "https://github.com/gamache/epice/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rspec')
end
