ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

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
	
	# Copied from http://joshuaclayton.github.com/code/2009/07/14/should-act-as-list.html & slightly modified
	def self.should_act_as_list(options = {})
		should have_instance_methods(:scope_condition, :position_column, :insert_at)

		klass = self.name.gsub(/Test$/, "").constantize
		options[:column] ||= "position"
		options[:scope] ||= "1 = 1"

		context "acting as a list" do
			should "use the correct column" do
				instance = get_instance_of(klass)
				assert_equal options[:column].to_s, instance.position_column
			end

			should "scope by `#{options[:scope].inspect}`" do
				instance = get_instance_of(klass)
				if options[:scope].is_a?(Symbol) && options[:scope].to_s !~ /_id$/
					options[:scope] = "#{options[:scope]}_id".intern
				end

				if options[:scope].is_a?(Symbol)
					instance.send("#{options[:scope]}=", nil)
					assert_equal "#{options[:scope]} IS NULL", instance.scope_condition

					instance.send("#{options[:scope]}=", 5)
					assert_equal "#{options[:scope]} = 5", instance.scope_condition
				else
					assert_equal options[:scope], instance.scope_condition
				end
			end
		end
	end
	
end