class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :due_date, presence: true
  # validates_date :due_date

  belongs_to :goal
  belongs_to :user

  def self.by_date
    sorted = self.all.sort_by &:due_date
    sorted.select do |task|
      if task.completed == false
        task
      end
    end
  end

  def completed?
    self.completed ? "Completed. You're Awesome!" : "Not Yet Completed"
  end

end
