# -*- encoding: utf-8 -*-
# stub: bootstrap-table-rails 1.11.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-table-rails"
  s.version = "1.11.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Chiu"]
  s.date = "2017-03-09"
  s.description = "An extended Bootstrap table(wenzhixin/bootstrap-table), integrated in Rails assets pipeline."
  s.email = ["bjevanchiu@gmail.com"]
  s.homepage = "https://github.com/bjevanchiu/bootstrap-table-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.2"
  s.summary = "an asset gemification of the bootstrap-table plugin"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
