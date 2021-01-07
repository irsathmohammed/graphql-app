module GraphqlApp
  module Exceptions
    class FailedLogin < Base
      def initialize(message = nil)
        @message = message
      end

      def message
        @message || "Incorrect email/password combination"
      end

      def code
        return :unauthorized
      end

      def sub_code
        return :unauthorized
      end      
    end

  end
end
