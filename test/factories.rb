Factory.define :article do |t|
	t.title {|x| x.section.name + Factory.next(:article_title) }
	t.author "Bob Sue"
	t.body Forgery::LoremIpsum.paragraphs(5)
	t.status "status here"
	t.comments_allowed false
	#t.section_id
	#t.position
	t.notes "notes here"
	t.teaser "I am a teaser."
	t.styles "styles here"
	t.year "10-11"
	#t.created_at
	#t.updated_at
	#t.photo_file_name
	#t.photo_content_type
	#t.photo_file_size
	#t.photo_updated_at
	t.association :section # 'belongs to a section'
end

# Sequences
Factory.sequence :article_title do |n|
	"Article#{n}"
end