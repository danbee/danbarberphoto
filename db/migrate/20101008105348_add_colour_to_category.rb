class AddColourToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :base_colour, :string
  end

  def self.down
    remove_column :categories, :base_colour
  end
end
