class Task < ActiveRecord::Base
  belongs_to :goal
  has_many :users, :through=> :goals

  validates :description, presence: true
  validates :due_date, presence: true

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

  def upcoming_deadlines
    self.select do |task|
      if task.due_date <= Date.today + 7 && task.due_date >= Date.today
        task
      end
    end
  end

end
