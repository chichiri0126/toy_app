class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :description

      t.timestamps
    end
    add_index :topics, :user_id
  end
end
