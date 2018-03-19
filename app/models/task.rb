class Task < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :list, optional: true

  def task_status
    if self.status == 0
      "Incomplete"
    elsif self.status == 1
      "Done!"
    end
  end

  def self.incomplete
    where("status = 0")
  end
end
