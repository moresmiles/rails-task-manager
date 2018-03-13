class List < ApplicationRecord
  has_many :tasks, inverse_of: :list
  has_many :users, through: :tasks
  belongs_to :group
  validates :name, presence: true

 def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      if task_attribute[:name].present?
        task = Task.find_or_create_by(name: task_attribute[:name])
        if !self.tasks.include?(task)
          self.tasks << task
        end
      end
    end
  end

end
