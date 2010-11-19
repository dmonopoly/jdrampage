class User < ActiveRecord::Base
  acts_as_authentic
  
  def self.none?
    count == 0
  end
end
