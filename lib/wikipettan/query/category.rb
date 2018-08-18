module Wikipettan
  module Query
    class Category
      attr_reader :format

      def initialize(pageid: nil, title: nil, cmcontinue: nil)
        @pageid = pageid
        @title = title
        @cmcontinue = cmcontinue
        @format = :json
      end

      def api_params
        default_params.merge(target_params).merge({list: "categorymembers"})
      end

      private

      def target_params
        if @pageid
          {cmpageid: @pageid}
        else
          {cmtitle: "Category:#{@title}"}
        end
      end

      def default_params
        hash = {action: "query", cmlimit: 5000, format: @format.to_s}
        hash.merge!(cmcontinue: @cmcontinue) if @cmcontinue
        hash
      end
    end
  end
end
