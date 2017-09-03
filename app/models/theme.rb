class Theme < ActiveRecord::Base
  has_attached_file :image_url
  validates_attachment_content_type :image_url,content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  validates :user_id, presence: true

  belongs_to :genre
  has_many :results
end
