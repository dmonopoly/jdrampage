# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# If you want to use fixtures:
#require 'active_record/fixtures'
#Fixtures.create_fixtures("#{Rails.root}/test/fixtures","table_name_here, like users")

#require 'forgery'

User.create(:login=>"dakota",:password=>"northandsouth",:password_confirmation=>"northandsouth",:email=>"dmonopoly10@gmail.com")

# Sections - the problem with this syntax, as opposed to the user creation above,
# is that running rake db:seed multiple times will create the sections AGAIN
s = Section.create(:name => "Sports")
n = Section.create(:name => "News")
c = Section.create(:name => "Commentary")
e = Section.create(:name => "Entertainment")
f = Section.create(:name => "Features")

Section.all.each { |s| # done AGAIN if rake db:seed called again...
	5.times do Factory.create(:article, :section => s) end
}
