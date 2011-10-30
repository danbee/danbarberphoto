require 'mini_exiftool'

class Photo < ActiveRecord::Base
    has_and_belongs_to_many :categories

    has_attached_file :photo, :styles => {  :preview => "600x600",
                                            :size17 => "476x476#",
                                            :size11 => "308x308#",
                                            :size8 => "224x224#",
                                            :size5 => "140x140#",
                                            :size3 => "84x84#",
                                            :size2 => "56x56#" },
                      :storage => :s3,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :s3_protocol => "https",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'danbarberphoto',
                      :url  => ":s3_eu_url"

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

    def log_view
      if self.views.nil?
        self.views = 1
      else
        self.views += 1
      end
      self.save
    end

private
    def get_exif
        exif = MiniExiftool.new photo.queued_for_write[:original].path
        self.title = exif.title if self.title.empty?
        self.description = exif.description if self.description.empty?
        self.taken_at = exif.date_time_original
        self.save
    end
end
