module PhotosHelper
  def link_to_photo(photo)
    link_to '', photo.photo.url, :rel => 'photos', :class => 'fancy', :id => photo.id
  end
end
