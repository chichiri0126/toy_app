class CreateUserThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :user_threads do |t|
      t.integer :user_id
      t.string :title
      t.string :description

      t.timestamps
    end
    add_index :user_threads, :user_id
  end
end
