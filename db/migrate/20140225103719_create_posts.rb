class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :url
      t.integer :current_clicks
      t.integer :allowed_clicks
      t.integer :user_id

      t.timestamps
    end
  end
end
