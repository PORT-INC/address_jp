module AddressJp
  class City < ApplicationModel
    data_file 'cities'

    attr_accessor :id, :name, :prefecture_id
    belongs_to :prefecture
  end
end
