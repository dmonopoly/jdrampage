# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :backside

	# frontside homepage
	def home
		@articles = Article.all(:limit => 6)
		render :layout => 'application'
	end

	# backside homepage
	def backside
		@articles = Article.all(:limit => 6)
		render :layout => 'backside'
	end

end
=begin
I'm not sure why I have the backside method. It may be pointless.  The previewing system was kind of silly
... changes update immediately, so you may as well get rid of it. maybe later.

that said, the partials should be in the frontside view - not admin - unless the partial is exclusively
for the back. STATIC might use the partials, so in general try to keep in front.


=end

