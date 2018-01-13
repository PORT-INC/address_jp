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
        # TODO: find city, county, town, detail
        new(prefecture, nil, nil, nil, nil)
      end

      private

      def find_prefecture(string)
        if (prefecture_match = string.match(Prefecture.regex))
          Prefecture.find_by(name: prefecture_match.to_s)
        end
      end
    end
  end
end
