module Wikipettan
  class Query
    def initialize(cmpageid)
      @cmpageid = cmpageid
    end

    def api_params
      default_params.merge({list: "categorymembers", cmpageid: @cmpageid, cmlimit: 500})
    end

    private

    def default_params
      {action: "query", format: "json"}
    end
  end
end
