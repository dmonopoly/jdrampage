class ChangeArticleDateColumnType < ActiveRecord::Migration
  def self.up
    change_column :articles, :date, :date
  end

  def self.down
    change_column :articles, :date, :string
  end
end

