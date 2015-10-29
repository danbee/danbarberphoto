require 'cloudinary_image'

class Photo < ActiveRecord::Base
  has_and_belongs_to_many :categories

  paginates_per 11

  scope :enabled, -> { where(enabled: true) }

  scope :featured, -> { enabled.where(featured: true) }

  def to_s
    title
  end

  def name
    title
  end

  def image=(image_path)
    @image = CloudinaryImage.create(image_path)
    self.image_cloudinary_id = @image.id
  end

  def image
    @image ||= CloudinaryImage.new(image_cloudinary_id)
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
