class Group < ApplicationRecord
  has_many :group_users, inverse_of: :group
  has_many :users, through: :group_users
  has_many :lists


  def users_attributes=(users_attributes)
     users_attributes.values.each do |user_attribute|
       if user_attribute[:email].present?
         user = User.find_by(email: user_attribute[:email])
         if user && !self.users.include?(user)
           self.users << user
         end
       end
     end
   end

end
