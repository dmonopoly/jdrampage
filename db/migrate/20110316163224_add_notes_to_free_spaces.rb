class AddNotesToFreeSpaces < ActiveRecord::Migration
  def self.up
    add_column :free_spaces, :notes, :text
  end

  def self.down
    remove_column :free_spaces, :notes
  end
end
