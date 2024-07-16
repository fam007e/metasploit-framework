# -*- encoding: utf-8 -*-
# stub: patch_finder 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "patch_finder".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["wchen-r7".freeze]
  s.date = "2016-03-30"
  s.description = "Generic Patch Finder".freeze
  s.email = ["wei_chen@rapid7.com".freeze]
  s.executables = ["msu_finder".freeze]
  s.files = ["bin/msu_finder".freeze]
  s.homepage = "http://github.com/wchen-r7/patch-finder".freeze
  s.licenses = ["BSD-3-clause".freeze]
  s.rubygems_version = "3.3.25".freeze
  s.summary = "Patch Finder".freeze

  s.installed_by_version = "3.3.25" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
