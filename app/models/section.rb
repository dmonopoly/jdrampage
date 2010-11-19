class Section < ActiveRecord::Base
  has_many :articles
  
  def before_destroy
    articles.each do |a|
      a.section = Section.default_section
      a.save
    end
  end
  
  def self.default_section
    find_or_create_by_name("No section")
  end
end
