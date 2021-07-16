class PhotoShowcase < ActiveRecord::Migration[5.1]
  def self.up
    add_column :photos, :featured, :boolean, default: false
  end

  def self.down
    remove_column :photos, :featured
  end
end
