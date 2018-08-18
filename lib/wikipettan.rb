require "wikipettan/version"
require 'wikipettan/category'
require "wikipettan/query/page"
require "wikipettan/requester/page_requester"

module Wikipettan
  class << self
    def category(pageid: nil, title: nil)
      Wikipettan::Category.new(pageid: pageid, title: title)
    end

    def pages(title)
      query = Wikipettan::Query::Page.new(titles: title)
      requester = Wikipettan::Requester::PageRequester.new(query)
      requester.request!
      requester.pages
    end
  end
end
