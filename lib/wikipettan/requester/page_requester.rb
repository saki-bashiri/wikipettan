require 'wikipettan/requester/base'
require "wikipettan/page"
require 'json'
module Wikipettan
  module Requester
    class PageRequester < Wikipettan::Requester::Base
      def pages
        return [] if !json.key?("query") || !json["query"].key?("pages")
        json["query"]["pages"].values.map do |page|
          Wikipettan::Page.new(pageid: page["pageid"], title: page["title"], lastrevid: page["lastrevid"])
        end
      end

      def json
        @json ||= JSON.parse(@response)
      end
    end
  end
end
