module AddressJp
  module Util
    def self.root
      File.expand_path('../../../', __FILE__)
    end

    def self.load_master_data(file_name)
      YAML.load_file("#{root}/lib/address_jp/data/#{file_name}.yml")
    end
  end
end
