class RemovePaperclipColumnsFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
  end
end
