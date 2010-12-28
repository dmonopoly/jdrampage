ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "webrat"

Webrat.configure do |config|
	config.mode = :rails
end
	
class ActiveSupport::TestCase

  # Add more helper methods to be used by all tests here...
	
	# Copied from Giant Robots: http://robots.thoughtbot.com/post/159807028/testing-paperclip-with-shoulda & slightly modified
	def self.should_have_attached_file(attachment)
    klass = self.name.gsub(/Test$/, '').constantize

    context "To support a paperclip attachment named #{attachment}, #{klass}" do
      should have_db_column("#{attachment}_file_name").of_type(:string)
      should have_db_column("#{attachment}_content_type").of_type(:string)
      should have_db_column("#{attachment}_file_size").of_type(:integer)
    end

    should "have a paperclip attachment named ##{attachment}" do
      assert klass.new.respond_to?(attachment.to_sym), 
             "@#{klass.name.underscore} doesn't have a paperclip field named #{attachment}"
      assert_equal Paperclip::Attachment, klass.new.send(attachment.to_sym).class
    end
  end
	
	# tests acts as list and default_scope :order => 'position'
	def self.should_act_as_list(options = {}) # can access parameters with options[:asdf]
		#klass = self.name.gsub(/Test/, "").constantize # converts string to class
		context "acting as a list" do
			should have_db_column :position
=begin This should handle :scope => whatever, too, and you haven't decided on that yet.
			should "move objects correctly" do
				instance = klass.first
				instance.move_to_bottom
				assert_equal klass.all[-1], instance
				instance.move_higher
				assert_equal klass.all[-2], instance
				instance.move_to_top
				assert_equal klass.first, instance
				instance.move_lower
				assert_equal klass.all[1], instance
			end
=end
		end
	end
	
	def activate_authlogic
		Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
	end
	
end