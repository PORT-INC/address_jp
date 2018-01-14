require 'spec_helper'

describe Address do
  context 'valid string' do
    context 'unique city' do
      it 'parse address string' do
        address = Address.parse('東京都新宿区西新宿')
        expect(address.prefecture.id).to eq 13
        expect(address.prefecture.name).to eq '東京都'
        expect(address.city.id).to eq 13104
        expect(address.city.name).to eq '新宿区'
      end
    end
  end
end
