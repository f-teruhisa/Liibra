class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name
      t.text :image_url
      t.integer :score
      t.text :themes_id
      t.timestamps null: false
    end
  end
end
