require 'spec_helper'

describe Ward do
  let(:ward) { Ward.new(id: 4101, city_id: 4100, name: '青葉区') }

  describe '#city' do
    subject { ward.city }
    it 'should be expected city' do
      expect(subject.name).to eq '仙台市'
    end
  end

  describe '#full_name' do
    subject { ward.full_name }
    it 'concat city name' do
      is_expected.to eq '仙台市青葉区'
    end
  end
end
