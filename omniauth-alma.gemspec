# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/alma/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-alma"
  spec.version       = Omniauth::Alma::VERSION
  spec.authors       = ["Chad Nelson"]
  spec.email         = ["chad.nelson@temple.edu"]

  spec.summary       = 'OmniAuth strategy for Alma'
  spec.description   = 'OmniAuth strategy for the Ex Libris Alma Library Management Platform'
  spec.homepage      = "https://github.com/tulibraries/omniauth-alma"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "alma", "> 0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
