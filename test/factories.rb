# Factories
Factory.define :article do |t|
	t.association :section # belongs to a section
	t.title {|x| "Wellness Day for Students (#{x.section.name} Article #{Factory.next(:count)})" }
	t.author "Adam Sue and James Merlin"
	t.credits "By Adam Sue and James Merlin\n\nPhoto courtesy of BlankTown"
	t.body { Forgery::LoremIpsum.paragraphs(5) }
	t.sequence(:position) { |n| n }
	t.teaser "The Corporate Communications Class will open the Rickey Casey Store on May 13th as its end-of-the-year project."
	t.date Date.today.to_s
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

