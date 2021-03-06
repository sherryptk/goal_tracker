class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   :description
      t.date     :due_date
      t.boolean  :completed, :default => false
      t.integer  :goal_id
      t.integer  :user_id
    end
  end
end
