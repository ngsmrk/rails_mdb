class Film < ActiveRecord::Base
  attr_accessible :name, :url, :description, :rating
  before_validation :clean_url #this is the name of a private method
  validates_presence_of :name, :url, :description

private
def clean_url
self.url.gsub!('http://', '') if self.url #self.url means it only runs this validation if there is a url
end

end


# == Schema Information
#
# Table name: films
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

