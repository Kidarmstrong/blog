class Post < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader

  has_many :comments

  validates :subject, presence: true, length: { maximum: 30 } 
  validates :main_body, presence: true

  #Scopes
  scope :carousel, lambda { |num| order('created_at DESC').limit(num) }

  def self.newest
    Post.last
  end

end
