class AddImageCloudinaryIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_cloudinary_id, :string
  end
end
