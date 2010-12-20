require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	
	should_belong_to :article
	should_validate_presence_of :body
	should_validate_presence_of :full_name
	should_validate_presence_of :email
	#should_validate_format_of :email, :with => //
	
end
