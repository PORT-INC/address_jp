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

    class << self
      def regex
        /(#{all.map(&:name).join('|')})/
      end

      def find(id)
        all.find { |prefecture| prefecture.id == id }
      end
    end
  end
end
