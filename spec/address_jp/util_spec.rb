require 'spec_helper'

describe Util do
  describe 'int_floor(46535, 20)' do
    subject { AddressJp::Util.int_floor(integer, base) }
    let(:integer) { 46535 }
    let(:base) { 20 }
    it { is_expected.to eq 46520 }
  end
end
