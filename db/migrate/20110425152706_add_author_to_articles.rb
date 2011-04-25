class AddAuthorToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :author, :string
  end

  def self.down
    remove_column :articles, :author
  end
end
