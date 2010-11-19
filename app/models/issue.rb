class Issue < ActiveRecord::Base
  has_attached_file :pdf, 
    :storage => :filesystem, 
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'jco-rampage'
  
  
  default_scope :order => 'released_on DESC'
end
