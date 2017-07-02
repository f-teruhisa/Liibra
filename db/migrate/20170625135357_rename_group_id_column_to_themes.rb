class RenameGroupIdColumnToThemes < ActiveRecord::Migration
  def change
    rename_column :themes, :group_id, :genre_id
  end
end
