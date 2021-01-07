class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :api_keys
  has_many :posts

  after_commit :generate_api_key  

  def generate_api_key
    logout
    api_keys.create
  end

  def live_api_key
    api_keys.active.last
  end  

  def logout
    api_keys.active.each { |api_key| api_key.expire }    
  end

end
