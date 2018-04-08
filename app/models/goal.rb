class Goal < ActiveRecord::Base
  has_many :categories
  belongs_to :user
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
  # def category=(name)
  #    self.category = Category.find_or_create_by(name: name)
  #  end
  #
  #  def category
  #     self.category.name
  #  end

end
