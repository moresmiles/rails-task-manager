class Task < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :list, optional: true

  def completed?
    if self.status == 0
      "Incomplete"
    elsif self.status == 1
      "Done!"
    end
  end
end
