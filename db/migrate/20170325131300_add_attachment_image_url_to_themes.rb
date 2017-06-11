class AddAttachmentImageUrlToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :image_url
    end
  end

  def self.down
    remove_attachment :themes, :image_url
  end
end
