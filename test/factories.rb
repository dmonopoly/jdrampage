# Factories
Factory.define :article do |t|
	t.association :section # belongs to a section
	t.title {|x| "#{x.section.name}Article#{Factory.next(:count)}" }
	#t.sequence(:title)  {|n| "Article#{n}"}
	t.author "Author Bob"
	t.body { Forgery::LoremIpsum.paragraphs(5) }
	t.status "status here"
	t.comments_allowed false
	t.notes "notes here"
	t.position { Factory.next(:count) } # problems? why only up to 2?
	t.teaser "I am a teaser."
	t.styles "styles here"
	t.year "10-11"
end

Factory.define :comment do |t|
	t.association :article
	t.body { Forgery::LoremIpsum.sentence }
	t.full_name "Commenter Bob"
	t.email "commenter@somewhere.com"
end

Factory.define :page do |t|
	t.sequence(:title) { |n| "Page#{n}" }
	t.styles "styles here"
	t.body { Forgery::LoremIpsum.paragraphs(5) }
	t.position { Factory.next(:count) }
end

# Do not need section factory
# Just remember to load seed data into the test db before testing

# Do not need user factory
Factory.define :user do |t|
	
end

# Sequences
Factory.sequence :count do |n|
	n
end