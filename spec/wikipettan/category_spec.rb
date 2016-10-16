require 'spec_helper'

describe Wikipettan::Category do
  subject { Wikipettan::Category.new(title: "dummy") }
  before do
    @member = Wikipettan::CategoryMember.new(1, title: "dummy")
    @hash = {
      "query" => {
        "categorymembers" => [{"pageid" => @member.pageid, "title" => @member.title}]
      }
    }
    allow(RestClient).to receive(:get).and_return(JSON.generate(@hash))
  end

  context "#all_request!" do
    it 'request succsess' do
      subject.all_request!
      expect(subject.members.first.pageid).to eq(@member.pageid)
      expect(subject.members.first.title).to eq(@member.title)
    end
  end
end
