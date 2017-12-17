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
    end
  end
end
