class Task < ActiveRecord::Base
  belongs_to :goal

  def completed?
    self.completed ? yes : no
  end
end
