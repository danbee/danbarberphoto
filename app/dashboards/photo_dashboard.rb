require "administrate/base_dashboard"

class PhotoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    title: Field::String,
    image: Field::Image,
    description: Field::Text,
    flickr_url: Field::String,
    taken_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    featured: Field::Boolean,
    enabled: Field::Boolean,
    id: Field::Number,
    sort: Field::Number,
    views: Field::Number,
    categories: Field::HasMany,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :image,
    :title,
    :taken_at,
    :views,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :image,
    :description,
    :flickr_url,
    :taken_at,
    :sort,
    :featured,
    :enabled,
    :categories,
  ]
end
