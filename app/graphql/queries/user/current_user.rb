module Queries
  module User
    class CurrentUser < Queries::BaseQuery
      description "Get the current user detail"

      type Types::Objects::User, null: false

      def resolve
        Current.user
      end

      def self.authorized?(object, context)
        context[:current_user].present?
      end
    end
  end
end
