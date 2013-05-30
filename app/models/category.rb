class Category < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates_presence_of :name, :slug

  has_slug :slug, from: :name
end
