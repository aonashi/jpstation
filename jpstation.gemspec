# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jpstation/version'

Gem::Specification.new do |spec|
  spec.name          = "jpstation"
  spec.version       = Jpstation::VERSION
  spec.authors       = ["aonashi"]
  spec.email         = ["aonashi010@gmail.com"]
  spec.summary       = %q{A Rails plugin for railway data in Japan.}
  spec.description   = %q{A Rails plugin for railway data in Japan.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 4.0.0'
  spec.add_dependency 'actionpack', '>= 4.0.0'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rails", ">= 4.0.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "ammeter"
end
