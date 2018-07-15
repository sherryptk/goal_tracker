class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :category_id
  has_many :tasks
  has_many :categories
end
