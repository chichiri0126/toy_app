class CreateTopicComments < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_comments do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.text :body, null: false
      t.datetime :commented_at, null: false

      t.timestamps
    end
    add_index :topic_comments, :user_id
    add_index :topic_comments, [:topic_id, :commented_at]
  end
end
