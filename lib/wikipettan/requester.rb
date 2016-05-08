require 'rest-client'
module Wikipettan
  class Requester
    BASE_URL = "https://ja.wikipedia.org/w/api.php"
    private_constant :BASE_URL

    def initialize(query_params)
      @query_params = query_params
    end

    def request!
      RestClient.get(BASE_URL, {params: @query_params.dup})
    end
  end
end
