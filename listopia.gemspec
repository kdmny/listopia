# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require "listopia/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "listopia"
  s.version     = Listopia::VERSION
  s.authors     = ["kdmny"]
  s.email       = ["kdmny30@gmail.com"]
  s.homepage    = "http://github.com/kdmny/listopia"
  s.summary     = "A better way to manage lists in Rails applications."
  s.description = "A better way to manage lists in Rails applications."

  s.files         = `git ls-files`.split($/)
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]
  s.add_dependency "rails", "~> 3.2.12"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
