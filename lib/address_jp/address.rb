module AddressJp
  class Address
    attr_reader :prefecture, :city, :ward, :county, :town, :detail

    def initialize(prefecture, city, ward, county, town, detail)
      @prefecture = prefecture
      @city = city
      @ward = ward
      @county = county
      @town = town
      @detail = detail
    end

    private_class_method :new

    def to_h
      {
        prefecture: @prefecture&.to_h,
        city: @city&.to_h,
        ward: @ward&.to_h,
        county: @county&.to_h,
        town: @town&.to_h,
        detail: @detail
      }
    end

    class << self
      def parse(string)
        prefecture = find_prefecture(string)
        case detect_type string
        when :city_ward
          # TODO: find ward, city, detail
        when :city
          city, detail = find_city_detail(string, prefecture)
          new(prefecture, city, nil, nil, nil, detail)
        when :town
          # TODO: find county, town, detail
        else
          raise ArgumentError
        end
      end

      def detect_type(string)
        return unless string.match(Prefecture.regex)
        if string.match(Ward.full_name_regex)
          :city_ward
        elsif string.match(City.regex) && !string.match(Ward.full_name_regex)
          :city
        elsif string.match(Town.full_name_regex)
          :town
        end
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
