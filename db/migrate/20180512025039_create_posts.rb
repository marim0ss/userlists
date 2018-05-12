class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.text :content
      t.string :post_image_name

      t.timestamps null: false
    end
  end
end
