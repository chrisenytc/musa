# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'musa/version'

Gem::Specification.new do |spec|
	spec.name          = "musa"
	spec.version       = Musa::VERSION
	spec.authors       = ["Christopher EnyTC"]
	spec.email         = ["chris@enytc.com"]

	spec.summary       = %q{Encrypt and decrypt files with aes-256-cbc.}
	spec.description   = %q{A gem to encrypt and decrypt files with aes-256-cbc.}
	spec.homepage      = "https://github.com/chrisenytc/musa"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.11"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rspec", "~> 3.0"
	spec.add_development_dependency "faker", "~> 1.6"
end
