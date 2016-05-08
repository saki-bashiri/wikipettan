require "wikipettan/version"
require 'wikipettan/query'
require 'wikipettan/requester'

module Wikipettan
  class << self
    def category_members(cmpageid)
      query = Wikipettan::Query.new(cmpageid)
      requester = Wikipettan::Requester.new(query.api_params)
      requester.request!
    end
  end
end
