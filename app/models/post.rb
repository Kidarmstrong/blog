class Post < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader

  # Relations
  has_many :comments

  # Validations
  validates :subject, presence: true, length: { maximum: 30 } 
  validates :main_body, presence: true
  validates :main_image, presence: true

  #Causing errors
  #validates :main_article, uniqueness: true, :if => :main_article?
#  validates_uniqueness_of :main_article, :if => :main_article

  # Callbacks
  before_save :set_caption
  before_save :set_main_article

  # Scopes
  scope :carousel, lambda { |num| show_on_index.order('created_at DESC').limit(num) }
  scope :main_article, lambda { where(main_article: true).first }
  scope :not_main_article, lambda { where(main_article: false) }
  scope :show_on_index, lambda { not_main_article.where(show_on_main_page: true).order('created_at DESC') }

  def self.newest
    Post.last
  end

  private 

  def set_caption
     self.caption = main_body.truncate(200, separator: ' ') if self.caption.empty?
  end

  def set_main_article
    # This could be moved to a index page default table
    if main_article?
      self.class.where('id != ?', self.id).update_all("main_article = f")
    end
  end
end
