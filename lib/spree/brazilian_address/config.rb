module Spree
  module BrazilianAddress
    
    class Config
      include Singleton
      include PreferenceAccess
      
      class << self
        def instance
          return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
          BrazilianAddressConfiguration.find_or_create_by_name("Brazilian Address configuration")
        end
      end
    end
  end
end