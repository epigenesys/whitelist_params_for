# -*- encoding: utf-8 -*-
require File.expand_path("../lib/whitelist_params_for/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "whitelist_params_for"
  s.version     = WhitelistParamsFor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Glen Mailer", "Mike Brown"]
  s.email       = ["glen@epigenesys.co.uk", "m.brown@epigenesys.co.uk"]
  s.homepage    = "http://github.com/epigenesys/whitelist_params_for"
  s.summary     = "Controller-level whitelisting of model batch update attributes"
  s.description = "Controller-level whitelisting of model batch update attributes"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "whitelist_params_for"

  s.add_dependency "rails", "~> 3.0"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
