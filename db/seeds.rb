# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'forgery'

# If you want to use fixtures:
#require 'active_record/fixtures'
#Fixtures.create_fixtures("#{Rails.root}/test/fixtures","table_name_here, like users")

User.create(:login=>"dakota",:password=>"northandsouth",:password_confirmation=>"northandsouth",:email=>"dmonopoly10@gmail.com")

# Sections
s = Section.create(:name => "Sports")
n = Section.create(:name => "News")
c = Section.create(:name => "Commentary")
e = Section.create(:name => "Entertainment")
f = Section.create(:name => "Features")

Forgery::LoremUpum.paragraphs(4)

Section.all.each { |s|
	Factory.create(:article, :section => s)
}