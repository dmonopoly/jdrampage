class Article < ActiveRecord::Base
  has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",
										:styles => { 
											:thumb => "100x100#",
											:small => "150x150>",
											:medium => "200x200" }

  has_many :comments, :dependent => :destroy
  belongs_to :section
  
  acts_as_list
	default_scope :order => 'position'
  #named_scope :front_page, :conditions => {:front_page => true}
  
  validates_presence_of :section, :title, :author, :body, :year
  validates_inclusion_of :year, :in => %w[ 09-10 10-11 ] # restricting :year to be any in the passed in array
	
  def self.per_page; 10; end
	
end
