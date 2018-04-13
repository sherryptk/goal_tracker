class Goal < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :categories
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def uncompleted_tasks
    self.tasks.select do |task|
      if !task.completed && task.due_date >= Date.today
        task
      end
    end
  end

  def past_due
    self.tasks.select do |task|
      if task.due_date < Date.today
        task
      end
    end
  end

end
