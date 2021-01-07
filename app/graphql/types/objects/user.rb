module Types
  module Objects
    class User < BaseObject
      field :email,  String, nil, null: false
      field :name, String, nil, null: true
      field :phone,  String, nil, null: true
    end
  end
end