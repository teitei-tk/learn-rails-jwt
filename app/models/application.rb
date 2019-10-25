class Application < ApplicationRecord
  def rsa_public_key
    OpenSSL::PKey::RSA.new(public_key)
  end
end
