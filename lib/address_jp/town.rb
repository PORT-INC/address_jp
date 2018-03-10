module AddressJp
  class Town < ApplicationModel
    data_file 'towns'

    attr_accessor :id, :prefecture_id, :county_id, :name
    belongs_to :prefecture
    belongs_to :county

    def full_name
      "#{county&.name}#{name}"
    end
  end

  # class name 'Village' is also available
  Village = Town
end
