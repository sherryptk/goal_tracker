class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :completed, :goal_id, :user_id
end
