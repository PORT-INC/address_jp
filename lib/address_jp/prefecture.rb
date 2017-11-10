module AddressJp
  class Prefecture
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id.to_i
      @name = name
    end

    class << self
      def all
        AddressJp::Util.load_master_data(:prefectures).map do |hash|
          AddressJp::Prefecture.new(**hash)
        end
      end

      def regex
        /(#{all.map(&:name).join('|')})/
      end
    end
  end
end
