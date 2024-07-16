# -*- encoding: utf-8 -*-
# stub: metasploit-payloads 2.0.166 ruby lib

Gem::Specification.new do |s|
  s.name = "metasploit-payloads".freeze
  s.version = "2.0.166"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["OJ Reeves".freeze, "Tod Beardsley".freeze, "Chris Doughty".freeze, "Brent Cook".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIERDCCAqygAwIBAgIBATANBgkqhkiG9w0BAQsFADAmMSQwIgYDVQQDDBttc2Zk\nZXYvREM9bWV0YXNwbG9pdC9EQz1jb20wHhcNMjMxMDMwMTYwNDI1WhcNMjUxMDI5\nMTYwNDI1WjAmMSQwIgYDVQQDDBttc2ZkZXYvREM9bWV0YXNwbG9pdC9EQz1jb20w\nggGiMA0GCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQDZN/EKv+yVjwiKWvjAVhjF\naWNYI0E9bJ5d1qKd29omRYX9a+OOKBCu5+394fyF5RjwU4mYGr2iopX9ixRJrWXH\nojs70tEvV1CmvP9rhz7JKzQQoJOkinrz4d+StIylxVxVdgm7DeiB3ruTwvl7qKUv\npiWzhrBFiVU6XIEAwq6wNEmnv2D+Omyf4h0Tf99hc6G0QmBnU3XydqvnZ+AzUbBV\n24RH3+NQoigLbvK4M5aOeYhk19di58hznebOw6twHzNczshrBeMFQp985ScNgsvF\nrL+7HNNwpcpngERwZfzDNn7iYN5X3cyvTcykShtsuPMa5zXsYo42LZrsTF87DW38\nD8sxL6Dgdqu25Mltdw9m+iD4rHSfb1KJYEoNO+WwBJLO2Y4d6G1CR66tVeWsZspb\nzneOVC+sDuil7hOm+6a7Y2yrrRyT6IfL/07DywjPAIRUp5+Jn8ZrkWRNo2AOwWBG\nk5gz7SfJPHuyVnPlxoMA0MTFCUnnnbyHu882TGoJGgMCAwEAAaN9MHswCQYDVR0T\nBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFIQfNa4E889ZE334cwU7eNu2hScH\nMCAGA1UdEQQZMBeBFW1zZmRldkBtZXRhc3Bsb2l0LmNvbTAgBgNVHRIEGTAXgRVt\nc2ZkZXZAbWV0YXNwbG9pdC5jb20wDQYJKoZIhvcNAQELBQADggGBAMfzvKcV27p7\npctmpW2JmIXLMrjNLyGJAxELH/t9pJueXdga7uj2fJkYQDbwGw5x4MGyFqhqJLH4\nl/qsUF3PyAXDTSWLVaqXQVWO+IIHxecG0XjPXTNudzMU0hzqbqiBKvsW7/a3V5BP\nSWlFzrFkoXWlPouFpoakyYMJjpW4SGdPzRv7pM4OhXtkXpHiRvx5985FrHgHlI89\nNSIuIUbp8zqk4hP1i9MV0Lc/vTf2gOmo+RHnjqG1NiYfMCYyY/Mcd4W36kGOl468\nI8VDTwgCufkAzFu7BJ5yCOueqtDcuq+d3YhAyU7NI4+Ja8EwazOnB+07sWhKpg7z\nyuQ1mWYPmZfVQpoSVv1CvXsoqJYXVPBBLOacKKSj8ArVG6pPn9Bej7IOQdblaFjl\nDgscAao7wB3xW2BWEp1KnaDWkf1x9ttgoBEYyuYwU7uatB67kBQG1PKvLt79wHvz\nDxs+KOjGbBRfMnPgVGYkORKVrZIwlaboHbDKxcVW5xv+oZc7KYXWGg==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2024-02-20"
  s.description = "Compiled binaries for Metasploit's Meterpreter".freeze
  s.email = ["oj@buffered.io".freeze, "tod_beardsley@rapid7.com".freeze, "chris_doughty@rapid7.com".freeze, "brent_cook@rapid7.com".freeze]
  s.homepage = "http://www.metasploit.com".freeze
  s.licenses = ["3-clause (or \"modified\") BSD".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.3.25".freeze
  s.summary = "This gem contains the compiled binaries required to make Meterpreter function, and eventually other payloads that require compiled binaries.".freeze

  s.installed_by_version = "3.3.25" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<gem-release>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<gem-release>.freeze, [">= 0"])
  end
end
