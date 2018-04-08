class Goals < ActiveRecord::Migration
  create_table :items do |t|
      t.string  :title
      t.string  :content
      t.integer :user_id
      t.integer :category_id
    end
end
