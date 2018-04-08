class Categories < ActiveRecord::Migration
  create_table :categories do |t|
      t.string   :name
      t.integer  :goal_id
    end
end
