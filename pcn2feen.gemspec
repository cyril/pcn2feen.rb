Gem::Specification.new do |spec|
  spec.name          = 'pcn2feen'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.io']
  spec.summary       = %q{PCN to FEEN converter}
  spec.description   = %q{Pcn2feen is a converter from PCN to FEEN, for programmer happiness.}
  spec.homepage      = 'https://github.com/cyril/pcn2feen.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.6'
  spec.add_development_dependency 'minitest', '~> 5'
  spec.add_development_dependency 'rake',     '~> 10'
end
