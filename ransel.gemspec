# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ransel/version'

Gem::Specification.new do |spec|
  spec.name          = "ransel"
  spec.version       = Ransel::VERSION
  spec.authors       = ["Julio Lucero"]
  spec.email         = ["poramo@gmail.com"]

  spec.summary       = %q{Automatic breadcrums for ransack.}
  spec.description   = %q{Automatic breadcrums for ransack.}
  spec.homepage      = "http://github.com/julioalucero/ransel"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec-rails", "~> 2.14.1"
  #spec.add_development_dependency 'activesupport'
  #spec.add_development_dependency 'actionpack'
end
