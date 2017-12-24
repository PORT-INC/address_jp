module AddressJp
  class ApplicationModel
    def initialize(**attributes)
      attributes.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end

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
        all.find { |model| model.id == id }
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

      def where(**conditions)
        all.select do |model|
          conditions.inject(true) do |true_or_false, (key, value)|
            true_or_false && model.send(key) == value
          end
        end
      end

      def find_by(**conditions)
        where(**conditions).first
      end
    end
  end
end
