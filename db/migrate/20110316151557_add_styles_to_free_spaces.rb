class AddStylesToFreeSpaces < ActiveRecord::Migration
  def self.up
    add_column :free_spaces, :styles, :text
  end

  def self.down
    remove_column :free_spaces, :styles
  end
end
