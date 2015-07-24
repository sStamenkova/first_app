class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
