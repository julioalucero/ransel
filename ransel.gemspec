# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ransel/version'

Gem::Specification.new do |spec|
  spec.name          = "ransel"
  spec.version       = Ransel::VERSION
  spec.authors       = ["Julio Lucero"]
  spec.email         = "poramo@gmail.com"

  spec.summary       = %q{Automatic breadcrums for ransack.}
  spec.description   = %q{Automatic breadcrums for ransack.}
  spec.homepage      = "http://github.com/julioalucero/ransel"
  spec.licenses      = ['MIT']

  spec.files         = ['lib/ransel.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec-rails', '~> 2.14', '>= 2.14.1'
end