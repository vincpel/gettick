# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','gettick','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'gettick'
  s.version = Gettick::VERSION
  s.author = 'Vincent Pelletier B.'
  s.email = 'vincpel@gmail.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A trading simulator'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','gettick.rdoc']
  s.rdoc_options << '--title' << 'gettick' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'gettick'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.13.4')
  s.add_runtime_dependency('json')
end
