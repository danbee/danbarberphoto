require 'exifr'

class Photo < ActiveRecord::Base
    has_and_belongs_to_many :categories

    has_attached_file :photo, :styles => {  :original => "1024x1024>",
                                            :size11 => "308x308#",
                                            :size8 => "224x224#",
                                            :size5 => "140x140#",
                                            :size3 => "84x84#",
                                            :size2 => "56x56#" }

    after_create :get_exif
    
    @@per_page = 11

private
    def get_exif
        exif = EXIFR::JPEG.new(photo.queued_for_write[:original].path)
        self.description = exif.image_description
    end
end
