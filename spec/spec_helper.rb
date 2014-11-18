$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

# RSpec
require 'rspec'

# Database
require 'pg'

# ActiveRecord::SaneSchemaDumper
require 'activerecord_sane_schema_dumper'

# Require our macros and extensions
Dir[File.expand_path('../../spec/support/macros/**/*.rb', __FILE__)].map(&method(:require))

RSpec.configure do |config|
  # Include our macros
  config.include DatabaseMacros

  config.before :each do
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      database: 'activerecord_sane_schema_dumper_test',
      user: 'postgres',
      schema_search_path: 'public'
    )

    ActiveRecord::Base.logger = ActiveRecord::Migration.verbose = false
  end
end
