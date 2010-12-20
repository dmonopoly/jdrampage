require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	
	context "An Article" do
		setup do
			# make sure the test db is already filled; that's why setup is unnecessary
		end
		
		should belong_to :section
		should have_many :comments
		
		should validate_presence_of :section
		should validate_presence_of :title
		should validate_presence_of :author
		should validate_presence_of :body
		should validate_presence_of :year
		
		#should_validate_inclusion_of :year, :in => %w[ 09-10 10-11 ]
		
		# the following need shoulda macros plugin installed first
		#should_have_attached_file :photo
		# should_act_as_list # what about order => 'position'?

	end
end
