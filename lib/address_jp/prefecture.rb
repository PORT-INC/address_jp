module AddressJp
  class Prefecture < ApplicationModel
    data_file 'prefectures'

    attr_reader :id, :name
    has_many :cities

    def initialize(id:, name:)
      @id = id.to_i
      @name = name
    end
  end
end
