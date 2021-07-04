class Category < ActiveRecord::Base
  has_and_belongs_to_many :photos

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  slug :slug, from: :name

  def to_s
    name
  end
end
