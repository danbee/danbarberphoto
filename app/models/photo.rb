require 'exifr'

class Photo < ActiveRecord::Base
    belongs_to :category

    has_attached_file :photo, :styles => {  :original => "1024x1024>",
                                            :size11 => "308x308#",
                                            :size8 => "224x224#",
                                            :size5 => "140x140#",
                                            :size3 => "84x84#",
                                            :size2 => "56x56#" }

    validates_presence_of :category

    before_post_process :get_exif

private
    def get_exif
        exif = EXIFR::JPEG.new(photo.queued_for_write[:original].path)
        self.description = exif.image_description
    end
end
