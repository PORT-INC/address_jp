require 'spec_helper'

describe Ward do
  let(:ward) { Ward.new(id: 4101, city_id: 4100, name: '青葉区') }

  describe '#city' do
    subject { ward.city }
    it 'should be expected city' do
      expect(subject.name).to eq '仙台市'
    end
  end
end
