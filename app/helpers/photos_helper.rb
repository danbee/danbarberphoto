module PhotosHelper
  def link_to_photo(photo)
    link_to "", photo.image.url, rel: "photos", class: "fancy", data: {id: photo.id}
  end
end
