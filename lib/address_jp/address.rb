module AddressJp
  class Address
    attr_reader :prefecture, :city, :county, :town, :detail

    class << self
      def parse(string)
        prefecture = find_prefecture(string)
        if prefecture
          # TODO: find city, county, town
        end
      end

      private

      def find_prefecture(string)
        string.match(Prefecture.regex)
      end
    end
  end
end
