class AddUserIdToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :user_id, :string
  end
end
