module AddressJp
  class Prefecture
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id.to_i
      @name = name
    end

    class << self
      def all
        AddressJp.load_master_data(:prefectures).map do |hash|
          AddressJp::Prefecture.new(**hash)
        end
      end
    end
  end
end
