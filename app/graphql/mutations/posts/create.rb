module Mutations
  module Posts
    class Create < Mutations::BaseMutation
      type Types::Objects::Post, null: false

      argument :body, String, required: true
      argument :post_type, String, required: true

      def resolve(args)
        context[:current_user].posts.create!(args.to_h)
      end

      def self.authorized?(object, context)
        context[:current_user].present?
      end      
    end
  end
end