require 'json'

require 'sepomex_hckdrk/client/json_api'
require 'sepomex_hckdrk/client/api_client'

require 'sepomex_hckdrk/error'
require 'sepomex_hckdrk/structs/zip_code'

require 'sepomex_hckdrk/general'

module SEPOMEX_HCKDRK
  @api_base = 'https://api-sepomex.hckdrk.mx/'

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
