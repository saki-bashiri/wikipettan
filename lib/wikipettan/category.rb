require 'wikipettan/category_query'
require 'wikipettan/requester/category_member_requester'
module Wikipettan
  class Category
    attr_reader :members

    def initialize(pageid: nil, title: nil)
      @pageid = pageid
      @title = title
      @members = []
    end

    def all_request!
      requester = get_members
      while requester.continue?
        requester = get_members(cmcontinue: requester.cmcontinue)
      end
    end

    private

    def get_members(cmcontinue: nil)
      query = member_query(cmcontinue: cmcontinue)
      requester = Wikipettan::Requester::CategoryMemberRequester.new(query)
      requester.request!

      @members += requester.members
      requester
    end

    def member_query(cmcontinue: nil)
      Wikipettan::CategoryQuery.new(pageid: @pageid, title: @title, cmcontinue: cmcontinue)
    end
  end
end
