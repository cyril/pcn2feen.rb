# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pcn2feen/version'

Gem::Specification.new do |spec|
  spec.name          = 'pcn2feen'
  spec.version       = Pcn2feen::VERSION
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.io']
  spec.description   = %q{Pcn2feen is a converter from PCN to FEEN, for programmer happiness.}
  spec.summary       = %q{PCN to FEEN converter}
  spec.homepage      = 'https://github.com/cyril/pcn2feen.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
