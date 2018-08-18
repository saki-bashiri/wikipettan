module Wikipettan
  module Query
    class Page
      attr_reader :format

      def initialize(titles:)
        @titles = titles
        @format = :json
      end

      def api_params
        default_params.merge(target_params)
      end

      private

      def target_params
        {titles: @titles}
      end

      def default_params
        {action: "query", prop: "info", format: @format.to_s}
      end
    end
  end
end
