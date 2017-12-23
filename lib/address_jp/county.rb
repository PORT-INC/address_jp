module AddressJp
  class County < ApplicationModel
    data_file 'counties'

    attr_accessor :id, :prefecture_id, :name
    belongs_to :prefecture
  end
end
