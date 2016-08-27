module Wikipettan
  class CategoryMember
    attr_reader :pageid, :title

    def initialize(pageid, title: nil)
      @pageid = pageid
      @title = title
    end
  end
end
