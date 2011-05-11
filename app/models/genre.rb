class Genre < ActiveRecord::Base
  has_many :films, :dependent => :destroy
  
  validates_presence_of :name
  
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

