module Wikipettan
  class CategoryMemberPage
    attr_reader :pageids

    def initialize(pageid: nil, title: nil)
      @query = Wikipettan::CategoryQuery.new(pageid: pageid, title: title)
      @pageids = []
    end

    def all_request!
      100.times do
        requester = push_pageids
        if requester.continue?
          @query.cmcontinue = requester.cmcontinue
        else
          break
        end
      end
    end

    def push_pageids
      requester = Wikipettan::CategoryMemberRequester.new(@query)
      requester.request!
      @pageids += requester.pageids
      requester
    end
  end
end
