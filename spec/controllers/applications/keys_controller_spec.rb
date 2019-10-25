require 'rails_helper'

RSpec.describe Applications::KeysController, type: :controller do
  describe 'POST applications/keys/:id' do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    let(:application) { create(:application) }

    context 'generated rsa private key' do
      before do
        post :create, params: { id: application.id }
      end

      it 'response[:private_key] is RSA Key' do
        expect { OpenSSL::PKey::RSA.new('invalid string') }.to raise_error(OpenSSL::PKey::RSAError)
        expect { OpenSSL::PKey::RSA.new(json_response[:private_key]) }.not_to raise_error
      end
    end

    context 'application.public_key' do
      it 'public key is update' do
        expect(application.public_key).to eq(nil)

        post :create, params: { id: application.id }

        app = Application.find(application.id)
        expect(application.reload.public_key).not_to eq(nil)
        expect(application.public_key).to eq(app.public_key)
      end
    end
  end
end
