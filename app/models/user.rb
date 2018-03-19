class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :tasks, inverse_of: :user
  has_many :lists, through: :tasks
  has_many :group_users, inverse_of: :user
  has_many :groups, through: :group_users

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
end
end
