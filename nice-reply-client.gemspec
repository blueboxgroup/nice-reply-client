# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nice_reply_client/version'

Gem::Specification.new do |spec|
  spec.name          = "nice-reply-client"
  spec.version       = Nice::Reply::Client::VERSION
  spec.authors       = ["Nell Shamrell"]
  spec.email         = ["nshamrell@bluebox.net"]
  spec.description   = %q{Simple wrapper for the Nice Reply API}
  spec.summary       = %q{Nice Reply API Wrapper}
  spec.homepage      = ""
  spec.license       = "Apache"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
