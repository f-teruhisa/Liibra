class AddLinkToElements < ActiveRecord::Migration
  def change
    add_column :elements, :link, :text
  end
end
