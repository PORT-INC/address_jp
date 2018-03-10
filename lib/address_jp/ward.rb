module AddressJp
  class Ward < ApplicationModel
    data_file 'wards'

    attr_accessor :id, :city_id, :name
    belongs_to :city

    def full_name
      "#{city.name}#{name}"
    end
  end
end
