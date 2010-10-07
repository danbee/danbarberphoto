class Photo < ActiveRecord::Base
    belongs_to :category

    has_attachment  :content_type => :image,
                    :storage => :file_system,
                    :max_size => 10.megabytes,
                    :processor => 'ImageScience',
                    :resize_to => '1024x1024>',
                    :thumbnails => { :thumb => '140x140' }

    validates_as_attachment
end
