# Factories
Factory.define :article do |t|
	t.association :section # 'belongs to a section'
	t.title {|x| x.section.name + Factory.next(:article_title) }
	t.author "Author Bob"
	t.body Forgery::LoremIpsum.paragraphs(5)
	t.status "status here"
	t.comments_allowed false
	t.notes "notes here"
	#t.position Factory.next(:count) ... maybe need .to_i
	t.teaser "I am a teaser."
	t.styles "styles here"
	t.year "10-11"
end

Factory.define :comment do |t|
	t.association :article
	t.body Forgery::LoremIpsum.sentence
	t.full_name "Commenter Bob"
	t.email "commenter@somewhere.com"
end

Factory.define :page do |t|
	t.title Factory.next(:page_title)
	t.styles "styles here"
	t.body Forgery::LoremIpsum.paragraphs(5)
	#t.position
end

# Do not need section factory
# Just remember to load seed data into the test db before testing

Factory.define :user do |t|
	
end

# Sequences
Factory.sequence :article_title do |n|
	"Article#{n}"
end

Factory.sequence :page_title do |n|
	"Page#{n}"
end

Factory.sequence :count do |n|
	n # need quotes?
end