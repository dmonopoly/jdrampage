class Page < ActiveRecord::Base
  acts_as_list
  default_scope :order => 'position'
end
