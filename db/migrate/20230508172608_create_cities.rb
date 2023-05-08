class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :population
      t.string :image
      t.string :country
    end
  end
end
