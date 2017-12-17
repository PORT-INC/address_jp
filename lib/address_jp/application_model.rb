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

      def belongs_to(model_name)
        define_method model_name do
          model_id = self.send("#{model_name}_id")
          model_name.to_s.classify.constantize.find(model_id)
        end
      end

      def has_many(model_name)
        define_method model_name do
          model_name.to_s.classify.constantize.all.select do |association|
            association_name = "#{self.class.to_s.underscore.split('/').last}_id"
            association.send(association_name) == self.id
          end
        end
      end
    end
  end
end
