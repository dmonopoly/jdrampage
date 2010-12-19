# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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

# Creating the articles
Article.delete_all # to prevent duplicate articles if rake db:seed is called > once
Section.all.each { |s|
	5.times do Factory.create(:article, :section => s) end
}

=begin

# Creating the comments
Comment.delete_all
Article.all.each { |a|
	3.times do Factory.create(:comment, :article => a) end
}

# Creating the pages
%w[ Page1 Page2 Page3 ].each do |page_title|
	Page.find_or_create_by_title(page_title) # note: "title" can be "name" or whatever
end

=end