class ChangeColumnTypeForFreeSpaceContent < ActiveRecord::Migration
  def self.up
    # from here on out, MySQL really should be the database instead of sqlite3
    # MySQL version: Ver 14.12 Distrib 5.0.83

    # :default was originally set for your content:string column, but
    # mysql does not allow a :default setting for any column of type text.
    # so, in order to change the type to :text, you first have to make the
    # production db drop the default.
    # You achieve this by running an SQL command...

    # Comment this line (the SQL command) if you're using a sqlite3 db.
    # (yeah, you really should have a development db that matches your production
    # in mysql). oh and note the single quotes... they're not '
    # execute "ALTER TABLE `free_spaces` ALTER COLUMN `content` DROP DEFAULT"

    change_column :free_spaces, :content, :text, :limit => nil
  end

  def self.down
    change_column :free_spaces, :content, :string, :default => "Insert free space content here."
  end
end

