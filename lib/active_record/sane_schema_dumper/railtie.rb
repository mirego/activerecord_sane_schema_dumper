require 'activerecord_sane_schema_dumper'
require 'rails'

module ActiveRecord::SaneSchemaDumper
  class Railtie < Rails::Railtie
    initializer 'activerecord_sane_schema_dumper.active_record' do |app|
      ActiveSupport.on_load :active_record do
        ActiveRecord::SchemaDumper.send(:include, ActiveRecord::SaneSchemaDumper::Extension)
      end
    end
  end
end
