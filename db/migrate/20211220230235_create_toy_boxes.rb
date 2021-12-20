class CreateToyBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :toy_boxes do |t|
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
