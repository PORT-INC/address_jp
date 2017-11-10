require 'address_jp/version'
require 'address_jp/prefecture'

require 'yaml'

module AddressJp
  def self.root
    File.expand_path('../..', __FILE__)
  end

  def self.load_master_data(file_name)
    YAML.load_file("#{AddressJp.root}/lib/address_jp/data/#{file_name}.yml")
  end
end
