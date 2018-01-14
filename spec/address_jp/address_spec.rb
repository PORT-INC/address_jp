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

    context 'duplicate city' do
      it 'parse address string' do
        # 福島県にも伊達市がある
        address = Address.parse('北海道伊達市鹿島町20-1')
        expect(address.city.prefecture.name).to eq '北海道'
        expect(address.city.name).to eq '伊達市'
      end
    end
  end
end
