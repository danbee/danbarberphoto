class AddEnabledToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    add_column :photos, :enabled, :boolean, default: true
  end

  def self.down
    remove_column :photos, :enabled
  end
end
