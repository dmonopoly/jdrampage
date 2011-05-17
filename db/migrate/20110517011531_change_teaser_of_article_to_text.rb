class ChangeTeaserOfArticleToText < ActiveRecord::Migration
  def self.up
		change_column :articles, :teaser, :text
  end

  def self.down
		change_column :articles, :teaser, :string
  end
end
