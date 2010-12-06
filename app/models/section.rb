class Section < ActiveRecord::Base
  has_many :articles
  acts_as_list
	default_scope :order => 'position'
	
  def before_destroy # safety measure: keeps all articles
    articles.each do |a|
      a.section = Section.default_section
      a.save
    end
  end
  
  def self.default_section
    find_or_create_by_name("No section") # deleted section is renamed
  end
end
