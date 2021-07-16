class AddColourToCategory < ActiveRecord::Migration[5.1]
  def self.up
    add_column :categories, :base_colour, :string
  end

  def self.down
    remove_column :categories, :base_colour
  end
end
