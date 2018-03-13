class GroupUser < ApplicationRecord
  belongs_to :group, inverse_of: :group_users, optional: true
  belongs_to :user, inverse_of: :group_users, optional: true
end
