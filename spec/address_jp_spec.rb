require "spec_helper"

describe AddressJp do
  it "has a version number" do
    expect(AddressJp::VERSION).not_to be nil
  end

  describe AddressJp::Prefecture do
    # TODO: better example
    it 'method works' do
      expect(AddressJp::Prefecture.all).to be_truthy
      expect(AddressJp::Prefecture.regex).to be_truthy
    end
  end
end
