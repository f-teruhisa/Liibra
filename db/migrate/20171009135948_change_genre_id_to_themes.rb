class ChangeGenreIdToThemes < ActiveRecord::Migration
  def change
    change_column :Themes, :genre_id, :integer
    change_column :Themes, :user_id, :integer
  end
end
