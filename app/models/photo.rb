require 'mini_exiftool'

class Photo < ActiveRecord::Base
    has_and_belongs_to_many :categories

    has_attached_file :photo, :styles => {  :size17 => "476x476#",
                                            :size11 => "308x308#",
                                            :size8 => "224x224#",
                                            :size5 => "140x140#",
                                            :size3 => "84x84#",
                                            :size2 => "56x56#" }

    after_create :get_exif
    
    @@per_page = 11

    scope :enabled, lambda {
      where(:enabled => true)
    }
    scope :featured, lambda {
      enabled.where(:featured => true)
    }
    
    def to_s
      self.title
    end
    
    def name
      self.title
    end

private
    def get_exif
        exif = MiniExiftool.new photo.queued_for_write[:original].path
        self.title = exif.title if self.title.empty?
        self.description = exif.description if self.description.empty?
        self.save
    end
end
