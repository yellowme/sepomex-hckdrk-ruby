require 'singleton'

module SEPOMEX
  class ApiClient
    include SEPOMEX::JsonApi

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
