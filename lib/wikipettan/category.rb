module Wikipettan
  class Category
    def initialize(pageid: nil, title: nil)
      @query = Wikipettan::CategoryQuery.new(pageid: pageid, title: title)
      @member_hashes = []
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

    def member_ids
      @member_hashes.map{|hash| hash["pageid"]}
    end

    def member_names
      @member_hashes.map{|hash| hash["title"]}
    end

    private

    def push_pageids
      requester = Wikipettan::CategoryMemberRequester.new(@query)
      requester.request!
      @member_hashes += requester.member_hashes
      requester
    end
  end
end
