class DeleteFreeSpaceFromSections < ActiveRecord::Migration
  def self.up
		remove_column :sections, :free_space
  end

  def self.down
		add_column :sections, :free_space, :text
  end
end
