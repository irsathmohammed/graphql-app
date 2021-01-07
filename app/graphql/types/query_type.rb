module Types
  class QueryType < Types::BaseObject
    field :currentUser,          resolver: Queries::User::CurrentUser
  end
end
