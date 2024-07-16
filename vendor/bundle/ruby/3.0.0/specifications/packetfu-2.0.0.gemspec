# -*- encoding: utf-8 -*-
# stub: packetfu 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "packetfu".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tod Beardsley".freeze, "Jonathan Claudius".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIENDCCApygAwIBAgIBATANBgkqhkiG9w0BAQsFADAiMSAwHgYDVQQDDBd0b2Ri\nL0RDPXBhY2tldGZ1L0RDPWNvbTAeFw0yMzA2MjcwMDExMjdaFw0yNDA2MjYwMDEx\nMjdaMCIxIDAeBgNVBAMMF3RvZGIvREM9cGFja2V0ZnUvREM9Y29tMIIBojANBgkq\nhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAyz2+nfp+Vv+JVHrJMy5Ck3qWBkiZmE0w\n7bR1I/bNXrCtv75l1GxTdRAoxKcXpXyC8elJQ9PEjEEDtdGBYQ13BKcQbDJ36etD\nwjbhRs5SBXgIilJAiR3i/cVnNoNJKOpiJZPufkOpag7Sg8Ze+cWbsc0gYN9nyCmz\nLYwWDC6Ji0KgJFw5YxFvIxVeOx86Ccfd64Wsa3EhkZd6fOpDE3029GWDqZwZTBIX\nRzJP4M7QZHZjq3gbHgSKFCFv0MqsjnQzUhPyB/U27c/n+wfRzZNx4Y1eRVm7gwPP\nLJDzt6mvtlXqc6pQ1NsR9hv3sieFLZDDPU1AaWiOAckIKcVoXB8sGnuFMczMW97o\nOZLfqfZUAN6LSY939T2sCyOcGhjxZIQbXtn/R/RAJ7UTfJld9UdthKm1W/f0cjwW\nyqoVsFL+nda6xfta9EnRqqFLOJqyX/wwA2cPO9B8EyM8vFEE8AG8wLu1tF3ggoMg\nrKut/WQADc3ymKAtsr9bOWajj7bIQVJnAgMBAAGjdTBzMAkGA1UdEwQCMAAwCwYD\nVR0PBAQDAgSwMB0GA1UdDgQWBBR2kf7ATPt3O7Lpc0uyyCiow3P88DAcBgNVHREE\nFTATgRF0b2RiQHBhY2tldGZ1LmNvbTAcBgNVHRIEFTATgRF0b2RiQHBhY2tldGZ1\nLmNvbTANBgkqhkiG9w0BAQsFAAOCAYEAZMp8nY7WzGOPO6TrAlZg37D3s3Rcm0/z\n6DBzFcY4F5CF3xq1Z/DZ3JwhjILaHPAZTvVT4uj91K4BYh/QgteS52C+O/9qsZ25\nL3Ocu4Yp+aU40KpjW+IjlzgTS3E21pCBrBTgT7NuTHmTmoNmHfE6Gbbig3a68C9z\nLcXj2RaEQuhOKrq5vw/0AV34wRieClM/oW8kWAKJDQ8/WEocHQpO1K/dhQ9hHNir\nlMpjKXsWuxdAZPyvNj15w9fw5a4gZgW26P4VBNJUD/iCe7QYhwXrhdhxf+cygW2A\ngBCt2UC6yISUDFiajyTw8cTJB1UyfLIADS4hiOEShx7hvVee444bgmOA99C+YuzT\nFFUt9KVtWsXKD0R6GBvbAUW4/LjmXCCM+Z3uWo1Ph6zljlNHz6/tg+SB7DVgsI3i\nXuSkzAmFsPisZ7uZk/7gJVlmyaqIxdrPVt9ZOTeSc/8pgSoRurHEJ7KlUXv4kcYM\nF3a8dA5tl/TC0vkHlCtghhLuD46SlAmH\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2023-06-28"
  s.description = "\n    PacketFu is a mid-level packet manipulation library for Ruby. With\n    it, users can read, parse, and write network packets with the level of\n    ease and fun they expect from Ruby.\n  ".freeze
  s.email = ["todb@packetfu.com".freeze, "claudijd@yahoo.com".freeze]
  s.extra_rdoc_files = [".document".freeze, "README.md".freeze]
  s.files = [".document".freeze, "README.md".freeze]
  s.homepage = "https://github.com/packetfu/packetfu".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.3.25".freeze
  s.summary = "PacketFu is a mid-level packet manipulation library.".freeze

  s.installed_by_version = "3.3.25" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<pcaprub>.freeze, ["~> 0.13.1"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_development_dependency(%q<sdoc>.freeze, ["~> 0.4"])
    s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8"])
  else
    s.add_dependency(%q<pcaprub>.freeze, ["~> 0.13.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_dependency(%q<sdoc>.freeze, ["~> 0.4"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
  end
end
