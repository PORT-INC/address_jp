module AddressJp
  class ApplicationModel
    class << self
      def data_file(file_name)
        @data = AddressJp::Util.load_master_data(file_name)
      end

      def all
        @data.map do |attributes|
          new(**attributes)
        end
      end

      def regex
        /(#{all.map(&:name).join('|')})/
      end

      def find(id)
        all.find { |prefecture| prefecture.id == id }
      end
    end
  end
end
