module AddressJp
  class Address
    attr_reader :prefecture, :city, :county, :town, :detail

    def initialize(prefecture, city, county, town, detail)
      %w(prefecture city county town detail).each do |attribute|
        instance_variable_set "@#{attribute}", instance_eval(attribute)
      end
    end

    class << self
      def parse(string)
        prefecture = find_prefecture(string)
        city, detail = find_city_detail(string, prefecture)
        # TODO: find county, town, detail
        new(prefecture, city, nil, nil, detail)
      end

      private

      def find_prefecture(string)
        if (prefecture_match = string.match(Prefecture.regex))
          Prefecture.find_by(name: prefecture_match.to_s)
        end
      end

      def find_city_detail(string, prefecture)
        if (city_match = string.match(City.regex))
          city = City
            .where(name: city_match.to_s)
            .select { |city| city.prefecture.id == prefecture.id }
            &.first
          detail_position = city_match.end(1)
          detail = string[detail_position..-1]
          [city, detail]
        end
      end
    end
  end
end
