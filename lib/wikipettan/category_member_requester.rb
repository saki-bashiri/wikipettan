require 'wikipettan/requester'
require 'wikipettan/category_member'
module Wikipettan
  class CategoryMemberRequester < Wikipettan::Requester
    def members
      return [] if !json.key?("query") || !json["query"].key?("categorymembers")
      json["query"]["categorymembers"].map do |member|
        Wikipettan::CategoryMember.new(member["pageid"], title: member["title"])
      end
    end

    def continue?
      !cmcontinue.nil?
    end

    def cmcontinue
      hash = json["continue"]
      return nil unless hash
      hash["cmcontinue"]
    end

    def json
      @json ||= JSON.parse(@response)
    end
  end
end
