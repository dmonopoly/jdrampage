source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'authlogic', :git => "git://github.com/radar/authlogic.git"
gem 'cancan'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
#gem 'ckeditor', '3.4.2.pre' - later
gem 'acts_as_list', :git => "https://github.com/haihappen/acts_as_list.git"
gem "will_paginate", "~> 3.0.pre2"
gem 'dynamic_form'
gem 'mysql2'
gem 'nokogiri'
gem 'capistrano' # we deploy with capistrano

group :development, :test do
	gem 'sqlite3-ruby', :require => 'sqlite3'
	gem 'shoulda'
	gem 'cucumber-rails', '>= 0.5.1'
	gem 'database_cleaner'
	#gem 'webrat'
	gem 'capybara'
    gem "rspec-rails", ">= 2.0.0"
end

# These typically shouldn't be for production, but you need it for seed data
gem 'factory_girl_rails'
gem 'forgery'

