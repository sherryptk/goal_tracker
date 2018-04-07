class Goal < ActiveRecord::Base
  has_one :category
  belongs_to :user

end
