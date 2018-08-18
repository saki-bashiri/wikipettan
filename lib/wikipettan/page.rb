module Wikipettan
  class Page
    attr_reader :pageid, :title, :lastrevid

    def initialize(pageid:, title:, lastrevid:)
      @pageid = pageid
      @title = title
      @lastrevid = lastrevid
    end
  end
end
