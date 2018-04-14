class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :goals
  has_many :users, through: :goals

  def goal_by_category
    Goal.all.select do |goal|
      if self.goal_id == goal.id
        goal
      end
    end
  end

end
