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

  describe '#villages' do
    subject { prefecture.villages }
    it { is_expected.to be_truthy }
  end

  describe '.where' do
    subject { Prefecture.where(name: '沖縄県') }
    it 'get expected record' do
      expect(subject.size).to eq 1
    end
  end

  describe '.find_by' do
    subject { Prefecture.find_by(name: '沖縄県') }
    it 'get expected prefecture' do
      expect(subject.name).to eq '沖縄県'
      expect(subject.id).to eq 47
    end
  end
end
