module PhotosHelper
  def link_to_photo(photo)
    link_to '', "#{photo.image.url}.jpg", rel: 'photos', class: 'fancy', data: { id: photo.id }
  end
end
