require 'spec_helper'

describe Address do
  describe '.parse' do
    subject { Address.parse(string) }
    context 'unique city' do
      let(:string) { '東京都新宿区西新宿二丁目8番1号' }
      it 'parse address string' do
        expect(subject.prefecture.id).to eq 13
        expect(subject.prefecture.name).to eq '東京都'
        expect(subject.city.id).to eq 13104
        expect(subject.city.name).to eq '新宿区'
        expect(subject.detail).to eq '西新宿二丁目8番1号'
      end
    end
    context 'duplicate name city (1)' do
      let(:string) { '北海道伊達市鹿島町20-1' }
      it 'parse address string' do
        expect(subject.city.name).to eq '伊達市'
        expect(subject.city.id).to eq 1233
      end
    end
    context 'duplicate name city (2)' do
      let(:string) { '福島県伊達市保原町字舟橋180番地' }
      it 'parse address string' do
        expect(subject.city.name).to eq '伊達市'
        expect(subject.city.id).to eq 7213
      end
    end
  end

  describe '#to_h' do
    subject { address.to_h }
    let(:address) { Address.parse('東京都新宿区西新宿二丁目8番1号') }
    it 'should be expected hash' do
      hash = {
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
      }
      is_expected.to eq hash
    end
  end

  it 'can not call constructor directly' do
    expect { Address.new(nil, nil, nil, nil, nil, nil) }.to raise_error(NoMethodError)
  end
end
