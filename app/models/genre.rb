class Genre < ActiveRecord::Base
  has_many :films, :dependent => :destroy
  
  validates_presence_of :name
  
end
