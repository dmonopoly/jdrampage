require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	
	#def setup
		#@article = Factory.create(:article)
	#end
	
	should_belong_to :section
	should_have_many :comments
	
	should_validate_presence_of :section
	should_validate_presence_of :title
	should_validate_presence_of :author
	should_validate_presence_of :body
	should_validate_presence_of :year
	
	#should_validate_inclusion_of :year, :in => %w[ 09-10 10-11 ]
	
end
