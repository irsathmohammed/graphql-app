module GraphqlApp
  module Exceptions
    class Base < StandardError
      def initialize(message = nil)
        @message = message
      end

      def message
        @message || "Hello!"
      end
    end

  end
end