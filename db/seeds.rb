# This file should contain all the record creation needed to seed the database with its default values.
# Commands:
# rake db:seed - load seed data; defaults to development
# rake db:seed RAILS_ENV=test - load seed data for the test db
# rake db:setup - set up database by running migrations
# rake db:test:prepare - rebuild test db [after destroying it]
# rake test:units, (...)
# ruby -I test test/unit/article_test.rb

require 'forgery'

# NOTE:
# "create" calls save, whereas "create!" calls "save!"
# The difference? "create!" will raise an exception if the record is invalid.
# Also: "delete" directly deletes the record, whereas "destroy" triggers callbacks
# like before_destroy.

# Creating the users - User model specifies it acts_as_authentic, so no duplicates
User.create(:login=>"dakota",:password=>"northandsouth",:password_confirmation=>"northandsouth",:email=>"dmonopoly10@gmail.com")

# Creating the sections
%w[ Sports News Commentary Entertainment Features ].each do |section_name|
	Section.find_or_create_by_name(section_name)
end
puts "---created sections"

# Creating the articles
if Article.count == 0 # to prevent duplicate articles if rake db:seed is called > once; alternative to Article.delete_all, which causes id issues
	Section.all.each { |s|
		5.times do Factory.create(:article, :section => s) end
	}
	puts "---created articles"
else
	puts "---no need to create articles"
end

# Creating the comments
if Comment.count == 0
	Article.all.each { |a|
		3.times do Factory.create(:comment, :article => a) end
	}
	puts "---created comments"
else
	puts "---no need to create comments"
end

# Creating the pages
if Page.count == 0
	4.times do Factory.create(:page) end
	puts "---created pages"
else
	puts "---no need to create pages"
end

puts "---Done running seeds.rb!"