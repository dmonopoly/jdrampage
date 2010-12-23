class Page < ActiveRecord::Base
  validates_presence_of :title, :body
	
	acts_as_list
	default_scope :order => :position
end
