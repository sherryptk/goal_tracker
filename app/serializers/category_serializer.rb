class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :goal_id
  belongs_to :goal
end
