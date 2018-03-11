class Task < ApplicationRecord
  belongs_to :user, inverse_of: :tasks, optional: true
  belongs_to :list, inverse_of: :tasks, optional: true

  validates :name, presence: true
  validates :name, uniqueness: true

end
