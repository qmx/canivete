# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{canivete}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Douglas Campos"]
  s.date = %q{2010-08-09}
  s.email = %q{douglas@theros.info}
  s.files = ["lib/canivete", "lib/canivete/deprecate.rb", "lib/canivete.rb", "README.markdown", "Rakefile"]
  s.homepage = %q{http://qmx.me}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{ruby not-so swiss knife}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
