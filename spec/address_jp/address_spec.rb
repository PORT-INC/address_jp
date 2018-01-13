require 'spec_helper'

describe Address do
  context 'valid string' do
    it 'parse address string' do
      address = Address.parse('東京都新宿区西新宿')
      expect(address.prefecture.id).to eq 13
      expect(address.prefecture.name).to eq '東京都'
    end
  end
end
