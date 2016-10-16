require 'spec_helper'

describe Wikipettan do
  it 'has a version number' do
    expect(Wikipettan::VERSION).not_to be nil
  end

  subject { Wikipettan.category(title: "hoge") }

  it 'get a category' do
    expect(subject).to be_a(Wikipettan::Category)
  end
end
