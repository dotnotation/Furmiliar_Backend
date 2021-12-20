class CreateToys < ActiveRecord::Migration[6.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :photo
      t.string :price
      t.string :brand
      t.string :url
      t.integer :rating
      t.boolean :needs_repair
      t.boolean :squeaker
      t.boolean :crinkle
      t.boolean :treat

      t.timestamps
    end
  end
end
