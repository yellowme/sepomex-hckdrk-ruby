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

      zip_code = SEPOMEX::General.info_zip_code(zip_code: '97305')

      expect(zip_code).to be_a(SEPOMEX::ZipCode)
      expect(zip_code.zip_code).to eq('97305')
      expect(zip_code.settlement).to eq('Granjas Cholul')
      expect(zip_code.settlement_type).to eq('Colonia')
      expect(zip_code.municipality).to eq('Mérida')
      expect(zip_code.state).to eq('Yucatán')
      expect(zip_code.city).to eq('')
      expect(zip_code.country).to eq('México')
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
        zip_code = SEPOMEX::General.info_zip_code(zip_code: '97305123')
      rescue => exception
        expect(exception).to be_a(SEPOMEX::RequestError)
      end
    end
  end
end
