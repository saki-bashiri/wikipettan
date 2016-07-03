require 'rest-client'
module Wikipettan
  class Requester
    BASE_URL = "https://ja.wikipedia.org/w/api.php"
    private_constant :BASE_URL

    def initialize(query)
      @query = query
    end

    def request!
      @response = RestClient.get(BASE_URL, {params: @query.api_params.dup})
    end
  end
end
