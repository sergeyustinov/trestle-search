module Trestle
  module Search
    module Resource
      attr_writer :search
      attr_accessor :filters

      def initialize_collection(params)
        if searchable?
          search(params[:q], params)
        else
          super(params)
        end
      end

      def search(query, params)
        instance_exec(query.presence, params, &@search)
      end

      def searchable?
        @search
      end
    end
  end
end
