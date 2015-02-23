# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uniden/api/version'

Gem::Specification.new do |spec|
  spec.name          = "uniden-api"
  spec.version       = Uniden::Api::VERSION
  spec.authors       = ["Andrew Holman"]
  spec.email         = ["andy@conspyre.com"]
  spec.summary       = %q{Uniden methods to communicate with scanners.}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "active_attr", "0.8.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
