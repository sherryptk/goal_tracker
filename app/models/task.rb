class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :due_date, presence: true
  # validates_date :due_date

  belongs_to :goal
  belongs_to :user

  def completed?
    self.completed ? "Completed. You're Awesome!" : "Not Yet Completed"
  end

end
