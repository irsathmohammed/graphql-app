json.extract! user, :id, :name, :email, :phone, :sex, :created_at, :updated_at
json.url user_url(user, format: :json)
