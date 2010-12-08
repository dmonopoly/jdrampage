require 'forgery'

Factory.define :article do
	title "New JD Rampage Site"
	author "Bob Sue"
	body Forgery::LoremUpum.paragraphs(5)
	status "status here"
	comments_allowed false
	#section_id
	#position
	notes "notes here"
	teaser "After 2 years, the JD Rampage site has upgraded."
	styles "styles here"
	year "10-11"
	#created_at
	#updated_at
	#photo_file_name
	#photo_content_type
	#photo_file_size
	#photo_updated_at
	association :section # 'belongs to a section'
end

Factory.define :section do
	name 
	free_space
	position
	#created_at
	#updated_at
end