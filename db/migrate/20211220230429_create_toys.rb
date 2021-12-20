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
      t.belongs_to :toy_box, null: false, foreign_key: true

      t.timestamps
    end
  end
end
