class KeysController < ApplicationController
  def create
    rsa_keys = GenerateRsaKeys.new.generate

    render json: {
      private_key: rsa_keys[:private_key]
    }
  end
end
