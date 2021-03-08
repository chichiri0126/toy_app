class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end
    add_index :topics, :user_id
  end
end
