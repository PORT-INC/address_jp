require 'spec_helper'

describe County do
  let(:county) { County.new(id: 2300, prefecture_id: 2, name: '東津軽郡') }

  describe '#name' do
    subject { county.name }
    it { is_expected.to eq '東津軽郡' }
  end

  describe '#prefecture' do
    subject { county.prefecture }
    it 'get expected prefecture' do
      expect(subject.id).to eq 2
      expect(subject.name).to eq '青森県'
    end
  end

  describe '#towns' do
    subject { county.towns }
    it { is_expected.to be_truthy }
  end

  describe '#villages' do
    subject { county.villages }
    it { is_expected.to be_truthy }
  end
end
