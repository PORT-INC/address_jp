module AddressJp
  class Prefecture < ApplicationModel
    data_file 'prefectures'

    attr_accessor :id, :name
    has_many :cities
    has_many :counties
    has_many :towns
  end
end
