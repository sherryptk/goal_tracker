class Category < ActiveRecord::Base
  belongs_to :goals
  belongs_to :user

  def goal_by_category
    Goal.all.select do |goal|
      if self.goal_id == goal.id
        goal
      end
    end
  end

end
