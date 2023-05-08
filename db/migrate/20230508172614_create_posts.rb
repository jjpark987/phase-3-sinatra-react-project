class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :city_id
      t.string :category
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
