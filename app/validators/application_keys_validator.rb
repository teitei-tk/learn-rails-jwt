class ApplicationKeysValidator
  def initialize(application:, token:)
    @application = application
    @token = token
  end

  def call
    JWT.decode(@token, public_key, true, algorithm: 'RS256')
  end

  private

  def public_key
    @application.rsa_public_key
  end
end
