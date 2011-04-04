# This file should contain all the record creation needed to seed the database with its default values.
# Commands:
# rake db:seed - load seed data; defaults to development
# rake db:seed RAILS_ENV=test - load seed data for the test db
# rake db:setup - set up database by running migrations
# rake db:test:purge - empties the test database.
# rake db:test:prepare - checks for pending migrations and warns you appropriately (fails when schema DNE)
# rake db:test:load - recreates the test database from the current db/schema.rb
# rake test:units, (...) - BEWARE: test db will be erased and re-generated from your development database when you run "rake"
# ruby -I test test/unit/article_test.rb

require 'forgery'

# NOTE:
# "create" calls save, whereas "create!" calls "save!"
# The difference? "create!" will raise an exception if the record is invalid.
# Also: "delete" directly deletes the record, whereas "destroy" triggers callbacks
# like before_destroy.

# Creating the users - User model specifies it acts_as_authentic, so no duplicates
User.create(:login=>"dakota",:password=>"northandsouth",:password_confirmation=>"northandsouth",
						:email=>"dmonopoly10@gmail.com",:full_name => "David Zhang",:role=>"admin")

# Creating the sections
%w[ Sports News Commentary Entertainment Features ].each do |section_name|
	Section.find_or_create_by_name(section_name)
end
puts "---found or created sections"

# Creating the articles
if Article.count == 0 # to prevent duplicate articles if rake db:seed is called > once; alternative to Article.delete_all, which causes id issues
	Section.all.each { |s|
		25.times do Factory.create(:article, :section => s) end
	}
	puts "---created articles"
else
	puts "---no need to create articles"
end

# Sorting articles by section_position within each section
Section.all.each do |section|
	section.articles.each_with_index do |article, index|
		Article.update_all ['section_position=?', index+1], ['id=?', article.id]
	end
end
puts "---guaranteed section position for articles"

# Creating the comments
=begin
if Comment.count == 0
	Article.all.each { |a|
		3.times do Factory.create(:comment, :article => a) end
	}
	puts "---created comments"
else
	puts "---no need to create comments"
end
=end

# Creating the pages
if Page.count == 0
	4.times do Factory.create(:page) end
	puts "---created pages"
else
	puts "---no need to create pages"
end

# Creating the subscribers
if Subscriber.count == 0
  25.times do Factory.create(:subscriber) end
  puts "---created subscribers"
else
  puts "---no need to create subscribers"
end

# Creating the free spaces
if FreeSpace.count == 0
  content = 'Put desired content here.'
  # Home page free spaces
  Factory.create(:free_space, :name => 'Notification', :content => 'The site is currently undergoing changes.',
                  :notes => "This is the home page's notification area.")
  Factory.create(:free_space, :name => 'HomeLeftSidebar', :content => content,
                  :notes => "This is the home page's left sidebar content.")
  Factory.create(:free_space, :name => 'HomeRightSidebar', :content => content,
                  :notes => "This is the home page's right sidebar content.")
  # Section free spaces
  Section.all.each do |section|
    Factory.create(:free_space, :name => "#{section.name}LeftSidebar", :content => content,
                    :notes => "This is the left sidebar content for the #{section.name} section.")
    Factory.create(:free_space, :name => "#{section.name}RightSidebar", :content => content,
                    :notes => "This is the right sidebar content for the #{section.name} section.")
    Factory.create(:free_space, :name => "#{section.name}TopArea", :content => content,
                    :notes => "This is the top area content for the #{section.name} section.")
  end
  puts "---created free spaces"
else
  puts "---no need to create free spaces"
end

puts "---Done with seeds.rb!"

