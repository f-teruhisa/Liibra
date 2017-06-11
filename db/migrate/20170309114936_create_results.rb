class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.text :image_url
      t.integer :score
      t.text :themes_id
      t.text :elements_id
      t.timestamps null: false
    end
  end
end
