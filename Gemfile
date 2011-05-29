source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'authlogic', :git => "git://github.com/radar/authlogic.git"
gem 'cancan'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
#gem 'ckeditor', '3.4.2.pre' - later
gem 'acts_as_list', :git => "https://github.com/haihappen/acts_as_list.git"
gem "will_paginate", "~> 3.0.pre2"
gem 'dynamic_form'

group :production do
	gem 'mysql2'
	gem 'nokogiri'
	gem 'capistrano' # we deploy with capistrano
end

group :development, :test do
	gem 'sqlite3-ruby', :require => 'sqlite3'
	gem 'factory_girl_rails'
	gem 'forgery'
	gem 'shoulda'
	gem 'cucumber-rails'
	gem 'webrat'
	gem 'rspec'
end
