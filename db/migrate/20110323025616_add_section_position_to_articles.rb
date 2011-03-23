class AddSectionPositionToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :section_position, :integer
  end

  def self.down
    remove_column :articles, :section_position
  end
end
