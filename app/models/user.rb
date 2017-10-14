class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  # association for themes
  has_many :themes, dependent: :destroy

  # association for likes
  has_many :likes, dependent: :destroy
  has_many :like_themes, through: :likes, source: :theme

  def full_profile?
    avatar? && name?
  end
end
