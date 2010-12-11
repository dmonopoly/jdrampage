Factory.define :article do |t|
	t.title {|x| x.section.name + Factory.next(:article_title) }
	t.author "Bob Sue"
	t.body Forgery::LoremIpsum.paragraphs(5)
	t.status "status here"
	t.comments_allowed false
	t.notes "notes here"
	#t.position Factory.next(:count)
	t.teaser "I am a teaser."
	t.styles "styles here"
	t.year "10-11"
	t.association :section # 'belongs to a section'
end

Factory.sequence :article_title do |n|
	"Article#{n}"
end

Factory.sequence :count do |n|
	n
end