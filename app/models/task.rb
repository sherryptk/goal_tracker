class Task < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  def completed?
    self.completed ? "Completed. You're Awesome!" : "Not Yet Completed"
  end

end
