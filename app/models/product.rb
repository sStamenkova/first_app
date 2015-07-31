class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, PictureUploader
  acts_as_commontable
  acts_as_votable
  ratyrate_rateable "quality"
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  

  def self.search(query)
  	where("title like ?", "%#{query}%")
  end

end
