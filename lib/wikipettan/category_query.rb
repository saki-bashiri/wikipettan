module Wikipettan
  class CategoryQuery
    attr_reader :format
    attr_writer :cmcontinue

    def initialize(pageid: nil, title: nil)
      @pageid = pageid
      @title = title
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
