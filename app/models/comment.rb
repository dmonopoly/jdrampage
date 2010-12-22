class Comment < ActiveRecord::Base
  belongs_to :article
	
	validates_presence_of :body, :full_name, :email
	validates_format_of :email, :with => /@/
	
	# Idea: maybe commenters must have a jd email account to comment...no, not good.
	# then alumni or parents wouldn't be able to comment. regular email is better
	# as people check it. can also check inputed email with database and sending
	# a message asking to subscribe...and have recent comments on the front page!
end