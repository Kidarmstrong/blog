class Post < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader

  # Relations
  has_many :comments

  # Validations
  validates :subject, presence: true, length: { maximum: 30 } 
  validates :main_body, presence: true
  validates :main_image, presence: true

  # Callbacks
  before_save :set_caption

  # Scopes
  scope :carousel, lambda { |num| order('created_at DESC').limit(num) }

  def self.newest
    Post.last
  end

  private 

  def set_caption
     self.caption = main_body.truncate(200, separator: ' ') if self.caption.empty?
  end

end
