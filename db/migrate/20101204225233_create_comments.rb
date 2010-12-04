class CreateComments < ActiveRecord::Migration
  def self.up
		create_table :comments do |t|
			t.text :body
			t.integer :article_id
			t.string :full_name
			t.string :email
			
			t.timestamps
		end
  end

  def self.down
		drop_table :comments
  end
end
