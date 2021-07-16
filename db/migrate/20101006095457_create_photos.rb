class CreatePhotos < ActiveRecord::Migration[5.1]
  def self.up
    create_table :photos do |t|
      t.integer :category_id

      t.string :flickr_url

      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
