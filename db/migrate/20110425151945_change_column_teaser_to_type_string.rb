class ChangeColumnTeaserToTypeString < ActiveRecord::Migration
  def self.up
    change_column :articles, :teaser, :string
  end

  def self.down
    change_column :articles, :teaser, :text
  end
end

