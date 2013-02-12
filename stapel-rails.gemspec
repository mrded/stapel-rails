# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stapel-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "stapel-rails"
  gem.version       = Stapel::Rails::VERSION
  gem.authors       = ["mrded"]
  gem.email         = ["dmitry@demenchuk.me"]
  gem.description   = 'An experimental jQuery plugin that will group thumbnails by a shared data-attribute into a pile. When clicking on the pile, the thumbnails that belong to that pile will be spread into a grid using CSS transitions.'
  gem.summary       = 'Plugin will group thumbnails by a shared data-attribute into a pile'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
