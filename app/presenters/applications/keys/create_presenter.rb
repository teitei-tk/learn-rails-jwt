module Applications
  module Keys
    class CreatePresenter
      def initialize(private_key:)
        @private_key = private_key
      end

      def to_hash
        { private_key: @private_key }
      end
    end
  end
end
