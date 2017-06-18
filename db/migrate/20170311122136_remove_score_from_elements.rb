class RemoveScoreFromElements < ActiveRecord::Migration
  def change
    remove_column :elements, :score, :integer
    remove_column :elements, :themes_id, :text
  end
end
