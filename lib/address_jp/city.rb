module AddressJp
  class City
    attr_reader :id, :name

    def initialize(id:, name:, prefecture_id:)
      @id = id.to_i
      @prefecture_id = prefecture_id.to_i
      @name = name
    end

    def prefecture
      Prefecture.find(@prefecture_id)
    end

    class << self
      def all
        AddressJp::Util.load_master_data(:cities).map do |hash|
          AddressJp::City.new(**hash)
        end
      end

      def regex
        /(#{all.map(&:name).join('|')})/
      end
    end
  end
end
