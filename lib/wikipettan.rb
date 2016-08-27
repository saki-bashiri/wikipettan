require "wikipettan/version"
require 'wikipettan/category'

module Wikipettan
  class << self
    def category(pageid: nil, title: nil)
      Wikipettan::Category.new(pageid: pageid, title: title)
    end
  end
end
