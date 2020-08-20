$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "sepomex_hckdrk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "sepomex_hckdrk"
  spec.version     = SEPOMEX_HCKDRK::VERSION
  spec.date        = '2019-10-10'
  spec.description = "Ruby Bindings for SEPOMEX HCKDRK API"
  spec.summary     = "Ruby that provides a library to SEPOMEX HCKDRK API"
  spec.files       = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.authors     = ["Yellowme"]
  spec.email       = 'hola@yellowme.mx'
  spec.homepage    = 'https://rubygems.org/gems/sepomex-hckdrk-ruby'
  spec.license      = 'MIT'

  spec.add_dependency 'httparty', "~> 0.16.0"
  spec.add_dependency "json", "~> 2.0"
  spec.add_dependency 'activesupport', ">= 5.2"

  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "webmock", "~> 3.7"
  spec.add_development_dependency "simplecov", "~> 0.17"
end
