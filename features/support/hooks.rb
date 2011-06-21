# This file was created by David Zhang for all hooks needed for running Cucumber tests.

Before do
  # Creating the sections
  %w[ News Sports Commentary Entertainment Features ].each do |section_name|
	  Section.find_or_create_by_name(section_name)
  end
  #puts "...found or created sections..."

  # Creating the articles
  if Article.count == 0 # to prevent duplicate articles if rake db:seed is called > once; alternative to Article.delete_all, which causes id issues
	  Section.all.each { |s|
		  10.times do Factory.create(:article, :section => s) end
	  }
	  #puts "...created articles..."
  else
	  #puts "...no need to create articles..."
  end
end

=begin
# MAY NOT USE
Before("@require_login") do
  # # superadmin
  User.create(:login=>"superadmin",:password=>"password",:password_confirmation=>"password",
						  :email=>"david_zhang_21@yahoo.com",:full_name => "David Zhang",:role=>"superadmin")
  # # admin
  User.create(:login=>"advisor",:password=>"password",:password_confirmation=>"password",
						  :email=>"tmathis@jd.cnyric.org",:full_name => "Trinity Mathis",:role=>"admin")
  # # moderators
  User.create(:login=>"moderator1",:password=>"password",:password_confirmation=>"password",
						  :email=>"myemail@somewhere.com",:full_name => "Rahul Raina",:role=>"moderator")
  User.create(:login=>"moderator2",:password=>"password",:password_confirmation=>"password",
						  :email=>"thatemail@someplace.com",:full_name => "Nick Harron",:role=>"moderator")
  User.create(:login=>"moderator3",:password=>"password",:password_confirmation=>"password",
  						:email=>"youremail@aplace.com",:full_name => "Lyndon Pisansky",:role=>"moderator")
  # # posters
  1.upto(5) do |i|
	  User.create(:login=>"poster#{i}",:password=>"password",:password_confirmation=>"password",
						  :email=>"poster#{i}@emailplace.com",:full_name => "Your Name #{i}",:role=>"poster")
  end

  # # Preventing the You must activate the Authlogic::Session::Base.controller with a controller object before creating objects (Authlogic::Session::Activation::NotActivatedError)

end
=end

