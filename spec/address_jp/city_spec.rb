require 'spec_helper'

describe City do
  describe '#prefecture' do
    subject { city.prefecture }
    let(:city) { City.new(id: 13101, prefecture_id: 13, name: '千代田区') }
    it 'get belong prefecture' do
      expect(subject.id).to eq 13
      expect(subject.name).to eq '東京都'
    end
  end
end
