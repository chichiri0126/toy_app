class CreateTopicComments < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_comments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.text :body
      t.datetime :commented_at

      t.timestamps
    end
    add_index :topic_comments, :user_id
    add_index :topic_comments, [:topic_id, :commented_at]
  end
end
