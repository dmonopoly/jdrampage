class ChangeColumnTypeForFreeSpaceContent < ActiveRecord::Migration
  def self.up
    # from here on out, MySQL really should be the database instead of sqlite3
    # MySQL version: Ver 14.12 Distrib 5.0.83
    execute "ALTER TABLE 'free_spaces' ALTER_COLUMN 'content' DROP DEFAULT"

    change_column :free_spaces, :content, :text, :limit => nil
  end

  def self.down
    change_column :free_spaces, :content, :string, :default => "Insert free space content here."
  end
end

