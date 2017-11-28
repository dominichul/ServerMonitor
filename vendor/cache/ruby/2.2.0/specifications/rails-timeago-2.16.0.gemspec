# -*- encoding: utf-8 -*-
# stub: rails-timeago 2.16.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-timeago"
  s.version = "2.16.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jan Graichen"]
  s.date = "2017-04-24"
  s.description = "jQuery Timeago helper for Rails 3"
  s.email = ["jan.graichen@altimos.de"]
  s.homepage = "https://github.com/jgraichen/rails-timeago"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.2"
  s.summary = "A Rails Helper to create time tags usable for jQuery Timeago plugin"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.1"])
      s.add_dependency(%q<actionpack>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.1"])
    s.add_dependency(%q<actionpack>, [">= 3.1"])
  end
end
