require 'active_support'
require 'active_support/core_ext'

module SEPOMEX_HCKDRK
  class General < ApiClient
    def self.info_zip_code(zip_code:)
      url = "query/info_cp/#{zip_code}"
      response = api_get(url: url)
      raise SEPOMEX_HCKDRK::RequestError.new(response[:error_message]) if !response.kind_of?(Array) && response[:error] == true
      payload = response[0]
      raise SEPOMEX_HCKDRK::RequestError.new(payload[:error_message]) if payload[:error] == true
      data = {
        zip_code: payload[:response][:cp].present? ? payload[:response][:cp] : nil,
        settlement: payload[:response][:asentamiento].present? ? payload[:response][:asentamiento] : nil,
        settlement_type: payload[:response][:tipo_asentamiento].present? ? payload[:response][:tipo_asentamiento] : nil,
        municipality: payload[:response][:municipio].present? ? payload[:response][:municipio] : nil,
        state: payload[:response][:estado].present? ? payload[:response][:estado] : nil,
        city: payload[:response][:ciudad].present? ? payload[:response][:ciudad] : nil,
        country: payload[:response][:pais].present? ? payload[:response][:pais] : nil
      }
      SEPOMEX_HCKDRK::ZipCode.new(*data.values_at(*SEPOMEX_HCKDRK::ZipCode.members))
    end
  end
end
