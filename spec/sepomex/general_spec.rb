require 'spec_helper'

describe SEPOMEX::General do
  describe '.info_cp' do
    it 'successfully creates a customer' do
      stub_request(:get, 'https://api-sepomex.hckdrk.mx/query/info_cp/97305').to_return(
        body:
          JSON.dump(
            [
              {
                error: false,
                code_error: 0,
                error_message: "null",
                response: {
                  cp: "97305",
                  asentamiento: "Granjas Cholul",
                  tipo_asentamiento: "Colonia",
                  municipio: "Mérida",
                  estado: "Yucatán",
                  ciudad: "",
                  pais: "México"
                }
              },
              {
                error: false,
                code_error: 0,
                error_message: "null",
                response: {
                  cp: "97305",
                  asentamiento: "Cabo Norte",
                  tipo_asentamiento: "Fraccionamiento",
                  municipio: "Mérida",
                  estado: "Yucatán",
                  ciudad: "",
                  pais: "México"
                }
              }
            ]
          ),
        status: 200
      )

      postal_code = SEPOMEX::General.info_cp(postal_code: '97305')

      expect(postal_code).to be_a(SEPOMEX::PostalCode)
      expect(postal_code.cp).to eq('97305')
      expect(postal_code.settlement).to eq('Granjas Cholul')
      expect(postal_code.settlement_type).to eq('Colonia')
      expect(postal_code.municipality).to eq('Mérida')
      expect(postal_code.state).to eq('Yucatán')
      expect(postal_code.city).to eq('')
      expect(postal_code.country).to eq('México')
    end

    it 'raises error whith invalid cp' do
      stub_request(:get, 'https://api-sepomex.hckdrk.mx/query/info_cp/97305123').to_return(
        body:
          JSON.dump(
            {
              error: true,
              code_error: 102,
              error_message: "La longitud del cp es inválida",
              response: "null"
            }
          ),
        status: 200
      )

      begin
        postal_code = SEPOMEX::General.info_cp(postal_code: '97305123')
      rescue => exception
        expect(exception).to be_a(SEPOMEX::RequestError)
      end
    end
  end
end
