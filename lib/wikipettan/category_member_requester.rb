require 'wikipettan/requester'
module Wikipettan
  class CategoryMemberRequester < Wikipettan::Requester
    def pageids
      json["query"]["categorymembers"].map{|member| member["pageid"]}
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
