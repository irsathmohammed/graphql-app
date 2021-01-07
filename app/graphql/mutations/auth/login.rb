module Mutations
  module Auth
    class Login < Mutations::BaseMutation
      type Types::Objects::ApiKey, null: false

      argument :auth, Types::Inputs::Auth::Login, required: true

      def resolve(auth:)
        user = User.find_by(email: auth[:email])
        if user && user.valid_password?(auth[:password])
          user.generate_api_key
        else
          raise GraphQL::ExecutionError, "You're not registered, please sign up"
        end
      end
    end
  end
end