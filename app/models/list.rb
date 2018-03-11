class List < ApplicationRecord
  has_many :tasks, inverse_of: :list
  has_many :users, through: :tasks
  validates :name, presence: true

 def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      task = Task.find_or_create_by(name: task_attribute[:name])
      self.tasks << task
    end
  end

end
