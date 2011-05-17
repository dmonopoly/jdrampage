class Article < ActiveRecord::Base
  belongs_to :section
	has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",#"/system/photos/original/default.jpg"
										:styles => {
											:display => "550x550>",
											:large => "300x300>",
											:medium => "200x200>",
											:thumb => "100x100#",
										}
  acts_as_list

  validates_presence_of :section, :title, :body, :date

end

