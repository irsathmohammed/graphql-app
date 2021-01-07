module Mutations
  module Auth
    class Logout < Mutations::BaseMutation
      type String, null: false

      def resolve
        context[:current_user].logout
        return "User successfully logged out"
      end

      def self.authorized?(object, context)
        context[:current_user].present?
      end
    end
  end
end