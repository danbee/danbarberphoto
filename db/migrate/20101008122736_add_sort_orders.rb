class AddSortOrders < ActiveRecord::Migration[5.1]
  def self.up
    add_column :photos, :sort, :integer
    add_column :categories, :sort, :integer
  end

  def self.down
    remove_column :photos, :sort
    remove_column :categories, :sort
  end
end
