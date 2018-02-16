class AddPhotoToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :photo_id, :integer
  end

  def self.down
    remove_column :categories, :photo_id
  end
end
