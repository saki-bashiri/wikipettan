require "wikipettan/version"
require 'wikipettan/category_query'
require 'wikipettan/category_member_requester'
require 'wikipettan/requester'
require 'wikipettan/category'

module Wikipettan
  class << self
    def category(pageid: nil, title: nil)
      Wikipettan::Category.new(ageid: pageid, title: title)
    end
  end
end
