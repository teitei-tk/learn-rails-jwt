# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  public_key  :text(65535)
#  website_url :text(65535)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Application < ApplicationRecord
  def rsa_public_key
    OpenSSL::PKey::RSA.new(public_key)
  end
end
