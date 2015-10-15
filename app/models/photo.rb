class Photo < ActiveRecord::Base
  has_and_belongs_to_many :categories

  dragonfly_accessor :image

  validates :image, presence: true

  self.per_page = 11

  scope :enabled, -> { where(enabled: true) }
  scope :featured, -> { enabled.where(featured: true) }

  after_create :process_exif

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

  private

  def process_exif
    self.title = exif.title if title.empty?
    self.description = exif.description if description.empty?
    self.taken_at = exif.date_time_original
    save
  end

  def exif
    @exif ||= MiniExiftool.new(image.file.path)
  end
end
