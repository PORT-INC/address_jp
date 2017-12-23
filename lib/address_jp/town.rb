module AddressJp
  class Town < ApplicationModel
    data_file 'towns'

    attr_accessor :id, :prefecture_id, :county_id, :name
    belongs_to :prefecture
    belongs_to :county
  end
end
