class AddViewCountToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    add_column :photos, :views, :integer, default: 0
  end

  def self.down
    remove_column :photos, :views
  end
end
