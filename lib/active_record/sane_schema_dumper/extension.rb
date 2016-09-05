module ActiveRecord
  module SaneSchemaDumper
    module Extension
      extend ActiveSupport::Concern

      included do
        alias_method_chain :table, :sane_alignment
      end

      def table_with_sane_alignment(table, main_stream)
        # Call the original method to populate our custom stream
        stream = StringIO.new
        table_without_sane_alignment(table, stream)

        # Rewind the stream and remove useless whitespace
        content = stream.tap(&:rewind).read.gsub(/(?<!^)(?<!\s)[ ]{2,}/, ' ')
        main_stream.print(content)

        # Rails expects the `#table` method to return the main stream
        main_stream
      end
    end
  end
end
