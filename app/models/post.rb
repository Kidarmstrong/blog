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
  scope :carousel, lambda { |num| show_on_index.order('created_at DESC').limit(num) }
  scope :starred, lambda { where(starred: true) }
  scope :not_starred, lambda { where(starred: false) }
  scope :show_on_index, lambda { where(visible: true).order('created_at DESC') }

  def self.newest
    Post.last
  end

  private 

  def set_caption
     self.caption = main_body.truncate(200, separator: ' ') if self.caption.empty?
  end
end
