class Goals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
        t.string  :title
        t.string  :description
        t.integer :user_id
        t.integer :category_id
    end
  end
end
