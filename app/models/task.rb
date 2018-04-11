class Task < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  def completed?
    self.completed ? "yes" : "no"
  end

end
