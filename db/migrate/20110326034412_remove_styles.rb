class RemoveStyles < ActiveRecord::Migration
  def self.up
		remove_column :free_spaces, :styles
    remove_column :articles, :styles
		remove_column :pages, :styles
  end

  def self.down
		add_column :free_spaces, :styles, :text
    add_column :articles, :styles, :text
		add_column :pages, :styles, :text
  end
end
