# -*- encoding: utf-8 -*-
# stub: ruby-progressbar 1.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-progressbar"
  s.version = "1.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["thekompanee", "jfelchner"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDrjCCApagAwIBAgIBATANBgkqhkiG9w0BAQUFADBOMRowGAYDVQQDDBFhY2Nv\ndW50c19ydWJ5Z2VtczEbMBkGCgmSJomT8ixkARkWC3RoZWtvbXBhbmVlMRMwEQYK\nCZImiZPyLGQBGRYDY29tMB4XDTE3MDgwMjIyNTgyMVoXDTE4MDgwMjIyNTgyMVow\nTjEaMBgGA1UEAwwRYWNjb3VudHNfcnVieWdlbXMxGzAZBgoJkiaJk/IsZAEZFgt0\naGVrb21wYW5lZTETMBEGCgmSJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEB\nBQADggEPADCCAQoCggEBAKunijEc/LhVt5JaoGNSvpxTGFH0B6nXlKczqYZwSq1v\nt+N9yjAqbbaWf/gEABZC4OyTKj8CMV+XifPjd1pZgyzTjnNA9H11V0L6iT6ecjTa\npsR7JOeDNBvvbQLIu1Bcq/YymX4XfUwGiUyP5ik9LUBCzkr9uSA4VrHdXEbU3vTf\nCO9LSE+IWMSGIsaKe1GO/JgZ8rBPeRU2UtLiKVdbZsN54r9g2ALWKeHbwe8I+/X2\n09Z5+O8umT6DyQ/ZQwJu1ose4S6xqKuZi3hrVLaZuqzrKXdFNa26YZvNesD69TkD\nSUyGUo0nCfFRdpasF5b7FPqQrFHpM98GWHTIGfLi+3ECAwEAAaOBljCBkzAJBgNV\nHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQUq9CqCtrqfHhfx7IQAJK/ZxuP\nlqUwLAYDVR0RBCUwI4EhYWNjb3VudHMrcnVieWdlbXNAdGhla29tcGFuZWUuY29t\nMCwGA1UdEgQlMCOBIWFjY291bnRzK3J1YnlnZW1zQHRoZWtvbXBhbmVlLmNvbTAN\nBgkqhkiG9w0BAQUFAAOCAQEAqjylrSicZbZBInAWZScw/c2oNz2kdnxh76IA/DbA\n+TCjytQRyKgbynEoBrYf/c6Mc1gPrjPINNubj3GICajOPmYjJZcyn0uBOthBKjOx\n23BI9sL4wNDvqJVkPuX9kd2YZP6S5UocoMVIrGouD8xzUFDAkghBJAI0rJyeW9ew\n8GYAA2UPxYOZS25L5NEbRvQyZTifbqxoUiCAET/gbrnodvTTXDhZ8JV45/Fr3K97\nPHO6SmWDz7oWa8pdUSTTn9dNIVaxsYYuqr1HyaHdhjItQLl/4S4wZu1yqMBEwyGO\nHGJ2WkoCJ6ABU8wsO70PQd9pl1M3stScQLd3vWgPeuioBQ==\n-----END CERTIFICATE-----\n"]
  s.date = "2017-09-27"
  s.description = "Ruby/ProgressBar is an extremely flexible text progress bar library for Ruby. The output can be customized with a flexible formatting system including: percentage, bars of various formats, elapsed time and estimated time remaining."
  s.email = ["support@thekompanee.com"]
  s.homepage = "https://github.com/jfelchner/ruby-progressbar"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.2"
  s.summary = "Ruby/ProgressBar is a flexible text progress bar library for Ruby."

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.6"])
      s.add_development_dependency(%q<rspectacular>, ["~> 0.70.6"])
      s.add_development_dependency(%q<fuubar>, ["~> 2.0"])
      s.add_development_dependency(%q<warning_filter>, ["~> 0.0.6"])
      s.add_development_dependency(%q<timecop>, ["= 0.6.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.6"])
      s.add_dependency(%q<rspectacular>, ["~> 0.70.6"])
      s.add_dependency(%q<fuubar>, ["~> 2.0"])
      s.add_dependency(%q<warning_filter>, ["~> 0.0.6"])
      s.add_dependency(%q<timecop>, ["= 0.6.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.6"])
    s.add_dependency(%q<rspectacular>, ["~> 0.70.6"])
    s.add_dependency(%q<fuubar>, ["~> 2.0"])
    s.add_dependency(%q<warning_filter>, ["~> 0.0.6"])
    s.add_dependency(%q<timecop>, ["= 0.6.1"])
  end
end