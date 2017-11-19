class Theme < ActiveRecord::Base
  

  has_attached_file :image_url
  validates_attachment_content_type :image_url,content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  validates :user_id, presence: true

  belongs_to :genre
  has_many :results

  # association for likes
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  # Confirmation already like!
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
