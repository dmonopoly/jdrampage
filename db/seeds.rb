# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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

text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque bibendum interdum turpis sed volutpat. Morbi porttitor, enim sit amet porta dapibus, enim purus consectetur nunc, vel varius massa tortor quis sem. Maecenas sit amet felis at lectus blandit cursus. Duis leo dui, viverra nec porta ut, pellentesque ac leo. Donec pretium cursus volutpat. Aenean consequat metus varius erat venenatis molestie pharetra dolor pharetra. Proin condimentum enim scelerisque tortor aliquet imperdiet. Vestibulum ullamcorper luctus purus, et dictum nisl bibendum vitae. Vestibulum hendrerit sagittis purus, at accumsan purus consectetur et. Pellentesque vehicula, purus in porta dapibus, augue ipsum luctus elit, ut varius quam diam pharetra diam. Phasellus sapien orci, gravida nec dapibus in, porta id urna. Nam iaculis justo sit amet massa euismod egestas. Vestibulum tincidunt, metus non dapibus euismod, ipsum ligula luctus tellus, a sagittis urna tellus vel sapien."

# Sports Articles

a1 = s.articles.create(:title=>"SportsArticle1",:author=>"Bob Brown",:body=>text) # doesn't work?

