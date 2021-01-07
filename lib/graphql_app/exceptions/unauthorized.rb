module GraphqlApp
  module Exceptions
    class Unauthorized < Base
      def initialize(message = nil)
        @message = message
      end

      def message
        @message || "Invalid Access Token"
      end

      def code
        return :unauthorized
      end

      def sub_code
        return :invalid_access_token
      end
    end

  end
end