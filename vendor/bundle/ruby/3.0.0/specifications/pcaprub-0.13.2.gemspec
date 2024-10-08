# -*- encoding: utf-8 -*-
# stub: pcaprub 0.13.2 ruby lib
# stub: ext/pcaprub_c/extconf.rb

Gem::Specification.new do |s|
  s.name = "pcaprub".freeze
  s.version = "0.13.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["shadowbq".freeze, "crondaemon".freeze, "jmcavinee".freeze, "unmarshal".freeze]
  s.date = "2024-04-22"
  s.description = "libpcap bindings for Ruby 2.x".freeze
  s.email = "shadowbq@gmail.com".freeze
  s.extensions = ["ext/pcaprub_c/extconf.rb".freeze]
  s.extra_rdoc_files = ["FAQ.rdoc".freeze, "LICENSE".freeze, "README.rdoc".freeze, "USAGE.rdoc".freeze, "ext/pcaprub_c/pcaprub.c".freeze]
  s.files = ["FAQ.rdoc".freeze, "LICENSE".freeze, "README.rdoc".freeze, "USAGE.rdoc".freeze, "ext/pcaprub_c/extconf.rb".freeze, "ext/pcaprub_c/pcaprub.c".freeze]
  s.homepage = "https://github.com/pcaprub/pcaprub".freeze
  s.licenses = ["LGPL-2.1".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.requirements = ["libpcap".freeze]
  s.rubygems_version = "3.3.25".freeze
  s.summary = "libpcap bindings for ruby".freeze

  s.installed_by_version = "3.3.25" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 0.9", ">= 0.9.2"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 0.6", ">= 0.6.0"])
    s.add_development_dependency(%q<shoulda-context>.freeze, ["~> 1.1", "~> 1.1.6"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 4.7", ">= 4.7.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9", ">= 0.9.2"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.6", ">= 0.6.0"])
    s.add_dependency(%q<shoulda-context>.freeze, ["~> 1.1", "~> 1.1.6"])
    s.add_dependency(%q<minitest>.freeze, ["~> 4.7", ">= 4.7.0"])
  end
end
