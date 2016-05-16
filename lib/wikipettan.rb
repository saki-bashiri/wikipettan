require "wikipettan/version"
require 'wikipettan/category_query'
require 'wikipettan/category_member_requester'
require 'wikipettan/category_member_page'
require 'wikipettan/requester'

module Wikipettan
  class << self
    def category_members(pageid: nil, title: nil)
      Wikipettan::CategoryMember.members(requester.json)
    end
  end
end
