require 'yaml'

module AddressJp
  module Util
    def self.root
      File.expand_path('../../../', __FILE__)
    end

    def self.load_master_data(file_name)
      YAML.load_file("#{root}/lib/address_jp/data/#{file_name}.yml")
    end

    def self.dump_yaml(object, file_name)
      file_path = "#{root}/lib/address_jp/data/#{file_name}.yml"
      YAML.dump(object, File.open(file_path, 'w'))
    end
  end
end
