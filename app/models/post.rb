class Post < ApplicationRecord
  belongs_to :user

  enum post_type: [:comment, :story]
end
