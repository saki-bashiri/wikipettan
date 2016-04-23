require 'rest-client'
module Wikipettan
  class Requester
    BASE_URL = "https://ja.wikipedia.org/w/api.php"
    private_constant :BASE_URL

    def initialize(query)
      @query = query
    end

    def request!
      RestClient.get(BASE_URL, @query.dup)
    end
  end
end
