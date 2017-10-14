class AddLikeCountToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :likes_count, :integer
  end
end
