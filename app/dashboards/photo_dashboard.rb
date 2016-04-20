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
    description: Field::MarkdownField,
    sort: Field::Number,
    featured: Field::Boolean,
    enabled: Field::Boolean,
    taken_at: Field::DateTime,
    views: Field::Number,
    image: Field::Image,
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
    :featured,
    :categories,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :description,
    :image,
    :id,
    :flickr_url,
    :created_at,
    :updated_at,
    :taken_at,
    :sort,
    :featured,
    :enabled,
    :views,
    :categories,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :description,
    :image,
    :flickr_url,
    :created_at,
    :updated_at,
    :taken_at,
    :sort,
    :featured,
    :enabled,
    :views,
    :categories,
  ]

  def display_resource(photo)
    photo.title
  end
end
