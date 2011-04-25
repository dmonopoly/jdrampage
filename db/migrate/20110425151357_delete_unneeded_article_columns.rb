class DeleteUnneededArticleColumns < ActiveRecord::Migration
  def self.up
    remove_column :articles, :notes
    remove_column :articles, :status
    remove_column :articles, :comments_allowed
  end

  def self.down
    add_column :articles, :notes, :text
    add_column :articles, :status, :string
    add_column :articles, :comments_allowed, :boolean
  end
end

