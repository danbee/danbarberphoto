class Photo < ActiveRecord::Base

  has_and_belongs_to_many :categories

  has_attached_file :photo, :styles => { :preview => "600x600",
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
                            :url => ':s3_domain_url'

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

end
