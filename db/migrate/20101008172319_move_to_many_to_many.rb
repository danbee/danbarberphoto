class MoveToManyToMany < ActiveRecord::Migration
  def self.up
    remove_column :photos, :category_id
    create_table :categories_photos, id: false do |t|
      t.integer :category_id
      t.integer :photo_id
    end
  end

  def self.down
    add_column :photos, :category_id, :integer
    drop_table :categories_photos
  end
end
