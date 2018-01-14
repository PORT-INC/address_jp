require 'spec_helper'

describe Address do
  context 'valid string' do
    context 'unique city' do
      let(:address) { Address.parse('東京都新宿区西新宿二丁目8番1号') }
      describe '#parse' do
        subject { address }
        it 'parse address string' do
          expect(subject.prefecture.id).to eq 13
          expect(subject.prefecture.name).to eq '東京都'
          expect(subject.city.id).to eq 13104
          expect(subject.city.name).to eq '新宿区'
          expect(subject.detail).to eq '西新宿二丁目8番1号'
        end
      end

      describe '#to_h' do
        subject { address.to_h }
        it 'should be expected hash' do
          is_expected.to eq({
            prefecture: {
              id: 13,
              name: '東京都'
            },
            city: {
              id: 13104,
              prefecture_id: 13,
              name: '新宿区'
            },
            ward: nil,
            county: nil,
            town: nil,
            detail: '西新宿二丁目8番1号'
          })
        end
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

  it 'can not call constructor' do
    expect { Address.new(nil, nil, nil, nil, nil, nil) }.to raise_error(NoMethodError)
  end
end
