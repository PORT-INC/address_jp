require 'spec_helper'

describe Prefecture do
  describe '.find' do
    subject { Prefecture.find(1) }
    it 'find prefecture by id' do
      expect(subject.id).to eq 1
      expect(subject.name).to eq '北海道'
    end
  end
end
