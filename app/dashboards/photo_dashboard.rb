require "administrate/base_dashboard"

class PhotoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    categories: Field::HasMany,
    id: Field::Number,
    flickr_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    title: Field::String,
    description: Field::Text,
    sort: Field::Number,
    featured: Field::Boolean,
    enabled: Field::Boolean,
    taken_at: Field::DateTime,
    views: Field::Number,
    image_uid: Field::String,
    image_name: Field::String,
    image_cloudinary_id: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :taken_at,
    :featured,
    :categories,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :categories,
    :id,
    :flickr_url,
    :created_at,
    :updated_at,
    :title,
    :description,
    :sort,
    :featured,
    :enabled,
    :taken_at,
    :views,
    :image_uid,
    :image_name,
    :image_cloudinary_id,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :categories,
    :flickr_url,
    :title,
    :description,
    :sort,
    :featured,
    :enabled,
    :taken_at,
    :views,
    :image_uid,
    :image_name,
    :image_cloudinary_id,
  ]

  # Overwrite this method to customize how photos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(photo)
  #   "Photo ##{photo.id}"
  # end
end
