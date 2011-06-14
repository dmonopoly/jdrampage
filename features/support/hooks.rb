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

