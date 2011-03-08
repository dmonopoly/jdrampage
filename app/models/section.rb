class Section < ActiveRecord::Base
  has_many :articles
  acts_as_list
	default_scope :order => :position
	validates_presence_of :name

  before_destroy {	# safety measure: moves all articles to a section called "No section"
		articles.each do |a|
      a.section = Section.default_section
      a.save
    end
  }

  def self.default_section
    find_or_create_by_name("No section") # deleted section is renamed
  end
end

