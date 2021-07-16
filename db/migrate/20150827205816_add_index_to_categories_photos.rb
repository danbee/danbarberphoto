class AddIndexToCategoriesPhotos < ActiveRecord::Migration[5.1]
  def change
    add_index :categories_photos, [:category_id, :photo_id], unique: true
  end
end
