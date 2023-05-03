class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :name 
      t.integer :population
      t.string :image
    end
  end
end
