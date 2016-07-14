require 'activerecord_sane_schema_dumper'
require 'rails'

module ActiveRecord
  module SaneSchemaDumper
    class Railtie < Rails::Railtie
      initializer 'activerecord_sane_schema_dumper.active_record' do
        ActiveSupport.on_load :active_record do
          ActiveRecord::SchemaDumper.prepend(ActiveRecord::SaneSchemaDumper::Extension)
        end
      end
    end
  end
end
