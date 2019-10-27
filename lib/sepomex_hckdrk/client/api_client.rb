require 'singleton'

module SEPOMEX_HCKDRK
  class ApiClient
    include SEPOMEX_HCKDRK::JsonApi

    def self.config
      yield self
    end

    def self.api_base
      @api_base
    end

    def self.api_base=(api_base)
      @api_base = api_base
    end
  end
end
