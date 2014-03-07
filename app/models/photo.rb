class Photo < ActiveRecord::Base

  has_and_belongs_to_many :categories

  dragonfly_accessor :image

  validates :image, presence: true

  @@per_page = 11

  scope :enabled, lambda {
    where(enabled: true)
  }
  scope :featured, lambda {
    enabled.where(featured: true)
  }

  def to_s
    self.title
  end

  def name
    self.title
  end

  def log_view
    if self.views.nil?
      self.views = 1
    else
      self.views += 1
    end
    self.save
  end

end
