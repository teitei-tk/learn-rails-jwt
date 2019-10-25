module Applications
  class KeysController < ApplicationController
    def create
      current_application = Application.find_by!(id: params[:id])
      rsa_keys = GenerateRsaKeys.new.generate

      Application.transaction do
        current_application.public_key = rsa_keys[:public_key]
        current_application.save!
      end

      render json: Applications::Keys::CreatePresenter.new(
        private_key: rsa_keys[:private_key]
      )
    end
  end
end
