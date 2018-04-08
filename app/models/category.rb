class Category < ActiveRecord::Base
  belongs_to :goal
  accepts_nested_attributes_for :goals

end
