class CorrectedFreeSpaceContentTypeChange < ActiveRecord::Migration
  def self.up
    change_column :free_spaces, :content, :text, :limit => nil, :default => nil
  end

  def self.down
    change_column :free_spaces, :content, :string, :default => "Insert free space content here."
  end
end

