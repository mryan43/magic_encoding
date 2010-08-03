# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{magic_encoding}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manuel Ryan"]
  s.date = %q{2010-08-03}
  s.default_executable = %q{magic_encoding}
  s.email = ["ryan@shamu.ch"]
  s.executables = ["magic_encoding"]
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc CHANGELOG LICENCE)
  s.homepage = %q{http://github.com/m-ryan/magic_encoding}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Easily add magic comments for encoding on multiple ruby source files}
  
end
