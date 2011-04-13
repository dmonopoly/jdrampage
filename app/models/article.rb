class Article < ActiveRecord::Base
  # include Paperclip ?
  has_many :comments, :dependent => :destroy
  belongs_to :section
	has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",#"/system/photos/original/default.jpg"
										:styles => {
											:large => "300x300",
											:medium => "200x200>",
											:thumb => "100x100#",
											 }
  acts_as_list

  validates_presence_of :section, :title, :author, :body, :date
  validates_format_of :date, :with => /\d\d\d\d-\d\d-\d\d/

end

