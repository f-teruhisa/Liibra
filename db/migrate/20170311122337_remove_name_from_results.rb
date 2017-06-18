class RemoveNameFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :name, :string
    remove_column :results, :image_url, :text
    remove_column :results, :link, :text
  end
end
