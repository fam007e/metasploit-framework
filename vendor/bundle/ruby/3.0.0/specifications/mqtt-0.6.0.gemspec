# -*- encoding: utf-8 -*-
# stub: mqtt 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mqtt".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nicholas J Humfrey".freeze]
  s.date = "2023-02-17"
  s.description = "Pure Ruby gem that implements the MQTT protocol, a lightweight protocol for publish/subscribe messaging.".freeze
  s.email = "njh@aelius.com".freeze
  s.homepage = "https://github.com/njh/ruby-mqtt".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.25".freeze
  s.summary = "Implementation of the MQTT protocol".freeze

  s.installed_by_version = "3.3.25" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.11.2"])
    s.add_development_dependency(%q<rake>.freeze, [">= 10.2.2"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0.9.11"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.5.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.9.2"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.45"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.11.2"])
    s.add_dependency(%q<rake>.freeze, [">= 10.2.2"])
    s.add_dependency(%q<yard>.freeze, [">= 0.9.11"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.5.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.45"])
  end
end
