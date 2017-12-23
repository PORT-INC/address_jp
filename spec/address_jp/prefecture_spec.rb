require 'spec_helper'

describe Prefecture do
  let(:prefecture) { Prefecture.new(id: 12, name: '千葉県') }

  describe '.find' do
    subject { Prefecture.find(1) }
    it 'find prefecture by id' do
      expect(subject.id).to eq 1
      expect(subject.name).to eq '北海道'
    end
  end

  describe '#cities' do
    subject { prefecture.cities }
    it { is_expected.to be_truthy }
  end

  describe '#counties' do
    subject { prefecture.counties }
    it { is_expected.to be_truthy }
  end

  describe '#towns' do
    subject { prefecture.towns }
    it { is_expected.to be_truthy }
  end
end
