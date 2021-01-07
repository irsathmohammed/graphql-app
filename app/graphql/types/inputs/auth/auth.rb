module Types
  module Inputs
    module Auth
      class Auth < Types::BaseInputObject
        description "Attributes for creating a user"

        argument :email,                        String,   nil,  required: true
        argument :name,                    String,   nil,  required: true        
        argument :phone,                   String,   nil,  required: true
        argument :password,                     String,   nil,  required: true


      end
    end
  end
end