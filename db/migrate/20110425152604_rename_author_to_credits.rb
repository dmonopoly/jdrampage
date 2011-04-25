class RenameAuthorToCredits < ActiveRecord::Migration
  def self.up
    rename_column :articles, :author, :credits
  end

  def self.down
    rename_column :articles, :credits, :author
  end
end

