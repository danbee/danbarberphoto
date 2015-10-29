class CloudinaryImage
  FORMATS = {
    admin_form:  { width: 32,  height: 32,  crop: :fill },
    admin_index: { width: 50,  height: 50,  crop: :fill },
    admin_show:  { width: 400, height: 400, crop: :fit },

    size2:  { width: 56,  height: 56,  crop: :fill },
    size3:  { width: 84,  height: 84,  crop: :fill },
    size5:  { width: 140, height: 140, crop: :fill },
    size8:  { width: 224, height: 224, crop: :fill },
    size11: { width: 308, height: 308, crop: :fill },
    size17: { width: 476, height: 476, crop: :fill },

    size2x2:  { width: 112, height: 112, crop: :fill },
    size3x2:  { width: 168, height: 168, crop: :fill },
    size5x2:  { width: 280, height: 280, crop: :fill },
    size8x2:  { width: 448, height: 448, crop: :fill },
    size11x2: { width: 616, height: 616, crop: :fill },
    size17x2: { width: 952, height: 952, crop: :fill }
  }

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.create(upload)
    id = upload.original_filename.split('.').first
    Cloudinary::Uploader.upload(upload, public_id: id)
    new(id)
  end

  def url(format = nil)
    if FORMATS[format].present?
      Cloudinary::Utils.cloudinary_url(id, FORMATS[format].dup)
    else
      Cloudinary::Utils.cloudinary_url(id)
    end
  end
end
