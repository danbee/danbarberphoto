class CreatePages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
