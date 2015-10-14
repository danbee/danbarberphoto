class Photo < ActiveRecord::Base
  has_and_belongs_to_many :categories

  dragonfly_accessor :image

  validates :image, presence: true

  self.per_page = 11

  scope :enabled, -> { where(enabled: true) }

  scope :featured, -> { enabled.where(featured: true) }

  def to_s
    title
  end

  def name
    title
  end

  def log_view
    if views.nil?
      self.views = 1
    else
      self.views += 1
    end
    save
  end
end
