class AddEnabledToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :enabled, :boolean, default: true
  end

  def self.down
    remove_column :photos, :enabled
  end
end
