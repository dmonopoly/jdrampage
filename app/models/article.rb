class Article < ActiveRecord::Base
  # include Paperclip ?
  has_many :comments, :dependent => :destroy
  belongs_to :section
	has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",#"/system/photos/original/default.jpg"
										:styles => {
											:thumb => "100x100#",
											:small => "150x150>",
											:medium => "200x200" }
  acts_as_list
	default_scope :order => :position

  validates_presence_of :section, :title, :author, :body, :date
  validates_format_of :date, :with => /\d\d\d\d-\d\d-\d\d/

  def self.per_page; 10; end # only if you paginate articles, which you don't

end

