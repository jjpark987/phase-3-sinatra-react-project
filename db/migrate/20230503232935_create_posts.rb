class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :city_id
      t.string :title
      t.string :category
      t.string :description
      t.timestamps
    end
  end
end
