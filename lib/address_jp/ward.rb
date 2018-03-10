module AddressJp
  class Ward < ApplicationModel
    data_file 'wards'

    attr_accessor :id, :city_id, :name
    belongs_to :city

    def full_name
      "#{city.name}#{name}"
    end

    class << self
      def full_name_regex
        /#{all.map(&:full_name).join('|')}/o
      end
    end
  end
end
