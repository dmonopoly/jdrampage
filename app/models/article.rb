class Article < ActiveRecord::Base
  # include Paperclip ?
	has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",#"/system/photos/original/default.jpg"
										:styles => {
											:thumb => "100x100#",
											:small => "150x150>",
											:medium => "200x200" }

  has_many :comments, :dependent => :destroy
  belongs_to :section

  acts_as_list
	default_scope :order => :position

  validates_presence_of :section, :title, :author, :body, :date
  validates_format_of :date, :with => /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/

  def self.per_page; 10; end

end

