class List < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks
  belongs_to :group, optional: true
  validates :name, presence: true

 def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      if task_attribute[:name].present?
        task = self.tasks.build(name: task_attribute[:name])
      end
    end
  end

end
