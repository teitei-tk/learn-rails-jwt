require 'rails_helper'

RSpec.describe KeysController, type: :controller do
  describe 'POST /keys/' do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }

    context 'generated rsa private key' do
      before do
        post :create
      end

      it 'response[:private_key] is RSA Key' do
        expect { OpenSSL::PKey::RSA.new('invalid string') }.to raise_error(OpenSSL::PKey::RSAError)
        expect { OpenSSL::PKey::RSA.new(json_response[:private_key]) }.not_to raise_error
      end
    end
  end
end
