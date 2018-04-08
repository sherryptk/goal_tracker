class Goal < ActiveRecord::Base
  has_many :categories
  belongs_to :user

  def category=(name)
     self.category = Category.find_or_create_by(name: name)
   end

   def category
      self.category.name
   end

end
