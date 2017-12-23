require 'spec_helper'

describe Town do
  let(:town_with_county) do
    Town.new(id: 47382, prefecture_id: 47, county_id: 47380, name: '与那国町')
  end
  let(:town_without_county) do
    Town.new(id: 13421, prefecture_id: 13, county_id: nil, name: '小笠原村')
  end

  describe 'prefecture' do
    subject { town_without_county.prefecture }
    it 'get expected prefecture' do
      expect(subject.id).to eq 13
      expect(subject.name).to eq '東京都'
    end
  end

  describe 'county' do
    subject { town.county }
    context 'with_county' do
      let(:town) { town_with_county }
      it 'get expected county' do
        expect(subject.id).to eq 47380
        expect(subject.name).to eq '八重山郡'
      end
    end
    context 'without_county' do
      let(:town) { town_without_county }
      it 'should be nil' do
        is_expected.to eq nil
      end
    end
  end
end

describe 'Village' do
  subject { Village.new(id: 13421, prefecture_id: 13, county_id: nil, name: '小笠原村') }
  it 'class name also available' do
    is_expected.to be_truthy
  end
end
