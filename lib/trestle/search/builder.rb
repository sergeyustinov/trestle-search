module Trestle
  module Search
    module Builder
      def search(&block)
        admin.search = block
      end

      def filter(options = {})
        admin.filters = [] unless admin.filters

        admin.filters << {
          name: name = options.fetch(:name),
          label: options.fetch(:label, name.to_s.camelcase),
          collection: options[:collection],
          remote_collection_url: options[:remote_collection_url],
          options: options
        }
      end
    end
  end
end
