module Types
  class MutationType < Types::BaseObject

    field :auth_signup,                  	resolver: Mutations::Auth::SignUp
    field :auth_login,                  	resolver: Mutations::Auth::Login
    field :create_post,                   resolver: Mutations::Posts::Create
    
  end
end
