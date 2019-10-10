module SEPOMEX
  class Error < StandardError
    attr_reader :response

    def initialize(response = {})
      @response = response
      super
    end
  end

  class RequestError < Error; end
end
