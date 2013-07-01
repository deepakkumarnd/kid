# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'kid/version'

Gem::Specification.new do |gem|
  gem.name                 = "kid"
  gem.version              = Kid::VERSION
  gem.authors              = ["Deepak"]
  gem.email                = ["deepakkumarnd@gmail.com"]
  gem.homepage             = ""
  gem.summary              = %q{ A machine learning based nlp program }
  gem.description          = %q{ A machine learning based nlp program }
  gem.files                = `git ls-files`.split("\n")
  # gem.test_files           = gem.files.grep(/^(spec|test|features)/)
  gem.executables          = gem.files.grep(/^bin/).map{ |f| File.basename(f) }
  gem.require_paths        = ["lib"]
  # gem.add_development_dependency "rspec"
  # gem.add_runtime_dependency "eventmachine"
end
