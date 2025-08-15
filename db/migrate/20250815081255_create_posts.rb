class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.bigint :user_id, null: false
      t.boolean :published, null: false
      t.timestamps
    end
  end
end
