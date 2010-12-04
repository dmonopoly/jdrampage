class CreateArticles < ActiveRecord::Migration
  def self.up
		create_table :articles do |t|
			t.string :title
			t.text :author
			t.text :body
			t.string :status
			t.boolean :comments_allowed
			t.integer :section_id
			t.integer :position
			t.text :notes
			t.text :teaser
			t.text :styles
			t.string :year
			
			t.timestamps
		end
  end

  def self.down
		drop_table :articles
  end
end
