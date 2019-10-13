module SEPOMEX
  class General < ApiClient
    def self.info_zip_code(zip_code:)
      url = "query/info_cp/#{zip_code}"
      response = api_get(url: url)
      raise SEPOMEX::RequestError.new(response[:error_message]) if !response.kind_of?(Array) && response[:error] == true
      payload = response[0]
      raise SEPOMEX::RequestError.new(payload[:error_message]) if payload[:error] == true
      data = {
        zip_code: payload[:response][:cp],
        settlement: payload[:response][:asentamiento],
        settlement_type: payload[:response][:tipo_asentamiento],
        municipality: payload[:response][:municipio],
        state: payload[:response][:estado],
        city: payload[:response][:ciudad],
        country: payload[:response][:pais]
      }
      SEPOMEX::ZipCode.new(*data.values_at(*SEPOMEX::ZipCode.members))
    end
  end
end
