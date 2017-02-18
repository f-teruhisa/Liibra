class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.text :image_url
      t.text :group_id
      t.text :information
      t.timestamps null: false
    end
  end
end
