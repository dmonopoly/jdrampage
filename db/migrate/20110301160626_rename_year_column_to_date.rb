class RenameYearColumnToDate < ActiveRecord::Migration
  def self.up
    rename_column :articles, :year, :date
  end

  def self.down
    rename_column :articles, :date, :year
  end
end

