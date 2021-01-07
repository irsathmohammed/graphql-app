class GraphQlSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "Permissions configuration do not allow the object you requested"
  end
end

GraphQL::Errors.configure(GraphQlSchema) do
  rescue_from(ActiveRecord::RecordNotFound) do |err|
    raise GraphQL::ExecutionError, err.message
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    GraphQL::ExecutionError.new(exception.record.errors.full_messages.join("\n"), extensions: {code: :unprocessable_entity, sub_code: :record_invalid, message: exception.record.errors.full_messages.join("\n")})
  end

  unless Rails.env.development?
    rescue_from StandardError do |exception|
      GraphQL::ExecutionError.new(("Please try to execute the query for this field later"), extensions: {code: :internal_server_error})
    end
  end
end
