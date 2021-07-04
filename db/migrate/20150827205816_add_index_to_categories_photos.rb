class AddIndexToCategoriesPhotos < ActiveRecord::Migration
  def change
    add_index :categories_photos, %i[category_id photo_id], unique: true
  end
end
