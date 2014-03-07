module PhotosHelper
  def link_to_photo(photo)
    link_to '', photo.image.url, rel: 'photos', class: 'fancy', id: photo.id
  end
end
