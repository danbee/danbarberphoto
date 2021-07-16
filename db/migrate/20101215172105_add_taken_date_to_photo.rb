class AddTakenDateToPhoto < ActiveRecord::Migration[5.1]
  def self.up
    add_column :photos, :taken_at, :datetime
  end

  def self.down
    remove_column :photos, :taken_at
  end
end
