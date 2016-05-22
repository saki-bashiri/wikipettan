require 'wikipettan/requester'
module Wikipettan
  class CategoryMemberRequester < Wikipettan::Requester
    def member_hashes
      return [] unless json["query"]
      json["query"]["categorymembers"]
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
