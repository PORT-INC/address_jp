module AddressJp
  class Prefecture < ApplicationModel
    data_file 'prefectures'

    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id.to_i
      @name = name
    end

    def cities
      City.all.select { |city| city.prefecture_id == @id }
    end
  end
end
