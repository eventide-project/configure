# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-configure'
  s.version = '0.1.3.0'
  s.summary = 'Generates class level configure methods'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/settings'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_development_dependency 'test_bench'
end
