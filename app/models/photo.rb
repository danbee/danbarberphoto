class Photo < ActiveRecord::Base
    belongs_to :category

    has_attached_file :photo, :styles => { :large => "1024x1024>", :thumb => "140x140#", :admin_thumb => "40x40#" }
end
