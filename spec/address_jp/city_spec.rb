require 'spec_helper'

describe City do
  let(:city) { City.new(id: 13101, prefecture_id: 13, name: '千代田区') }

  describe '#prefecture' do
    subject { city.prefecture }
    it 'get belong prefecture' do
      expect(subject.id).to eq 13
      expect(subject.name).to eq '東京都'
    end
  end

  describe 'wards' do
    subject { city.wards }
    it { is_expected.to be_truthy }
  end
end
