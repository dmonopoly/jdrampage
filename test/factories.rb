# Factories
Factory.define :article do |t|
	t.association :section # belongs to a section
	t.title {|x| "#{x.section.name}Article#{Factory.next(:count)}" }
	t.author "Author Bob"
	t.body { Forgery::LoremIpsum.paragraphs(5) }
	t.status "status here"
	t.comments_allowed false
	t.notes "notes here"
	t.sequence(:position) { |n| n }
	t.teaser "I am a teaser."
	t.date "#{DateTime.now.to_s[0..9]}"
end

Factory.define :comment do |t| # not used yet
	t.association :article
	t.body { Forgery::LoremIpsum.sentence }
	t.full_name "Commenter Bob"
	t.email "commenter@somewhere.com"
end

Factory.define :page do |t|
	t.sequence(:title) { |n| "Page#{n}" }
	t.body { Forgery::LoremIpsum.paragraphs(5) }
	t.sequence(:position) { |n| n }
end

# not used by seeds
Factory.define :section do |t|
    t.sequence(:name) { |n| "Section#{n}" }
    t.free_space "free space contents here"
    t.sequence(:position) { |n| n }
end

Factory.define :subscriber do |t|
    t.sequence(:email) { |n| "xyz#{n}@abc.com" }
end

# not used by seeds
Factory.define :user do |t|

end

Factory.define :free_space do |t|
  t.sequence(:name) { |n| "FreeSpace#{n}" }
end

# Sequences
Factory.sequence :count do |n|
	n
end

