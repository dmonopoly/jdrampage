class CreateFreeSpaces < ActiveRecord::Migration
  def self.up
    create_table :free_spaces do |t|
      t.string :content, :default => "Insert free space content here."
      t.string :name, :default => "Untitled"
      t.boolean :is_active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :free_spaces
  end
end

