class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.integer :user_thread_id
      t.text :body
      t.datetime :commented_at

      t.timestamps
    end
    add_index :user_comments, :user_id
    add_index :user_comments, [:user_thread_id, :commented_at]
  end
end
