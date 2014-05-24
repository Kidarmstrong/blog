class Post < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader

  has_many :comments

  validates :subject, presence: true, length: { maximum: 30 } 
  validates :main_body, presence: true
end
