class GenerateRsaKeys
  def initialize
    OpenSSL::Random.seed(File.read('/dev/random', 16))

    @rsa = OpenSSL::PKey::RSA.generate(4096)
  end

  def generate
    {
      private_key: @rsa.to_pem,
      public_key: @rsa.public_key.export,
    }
  end
end
