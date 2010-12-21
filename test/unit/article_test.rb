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
		
		should allow_value('09-10').for :year
		should allow_value('10-11').for :year
		should_not allow_value('2009-2010').for :year
		should_not allow_value('2010-2011').for :year
		should_not allow_value('08-09').for :year
		should_not allow_value('11-12').for :year
		#should ensure_inclusion_of(:year).in_range(%w[ 09-10 10-11 ])
		
		# the following need shoulda macros plugin installed first
		#should_have_attached_file :photo
		# should_act_as_list # what about order => 'position'?

	end
end
