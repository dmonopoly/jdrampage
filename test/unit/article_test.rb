require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	
	should_belong_to :section
	should_have_many :comments, :dependent => :destroy
	
	should_validate_presence_of :section
	should_validate_presence_of :title
	should_validate_presence_of :author
	should_validate_presence_of :body
	should_validate_presence_of :year
	
	#should_validate_inclusion_of :year, :in => %w[ 09-10 10-11 ]
	
	should_have_attached_file :photo
	# the following need shoulda macros plugin installed first
	# should_act_as_list # what about order => 'position'?
	
end
