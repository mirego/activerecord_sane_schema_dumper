# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/sane_schema_dumper/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord_sane_schema_dumper'
  spec.version       = ActiveRecord::SaneSchemaDumper::VERSION
  spec.authors       = ['Rémi Prévost']
  spec.email         = ['rprevost@mirego.com']
  spec.summary       = 'ActiveRecord::SaneSchemaDumper removes useless/harmful whitespace from Rails’ generated `db/schema.rb` files.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/mirego/activerecord_sane_schema_dumper'
  spec.license       = 'BSD 3-Clause'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '0.27.1'
  spec.add_development_dependency 'phare'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pg'

  spec.add_dependency 'rails', '>= 5', '< 6'

  spec.required_ruby_version = '>= 2.2.2'
end
