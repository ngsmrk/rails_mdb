class Comment < ActiveRecord::Base
  
  belongs_to :film 
  belongs_to :user
  
  validates_presence_of :user, :film, :text
  
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  text       :string(255)
#  film_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

