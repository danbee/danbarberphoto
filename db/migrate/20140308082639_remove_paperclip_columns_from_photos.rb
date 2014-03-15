class RemovePaperclipColumnsFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
  end
end
