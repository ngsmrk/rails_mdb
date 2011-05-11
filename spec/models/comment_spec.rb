require 'spec_helper'

describe Comment do
  it 'should not be valid without a film, user and text' do
    comment = Comment.new
    comment.should_not be_valid
  end
  
  it 'should be valid with a film, user and text' do
    comment = Comment.new(:text => 'Text')
    comment.film = Factory(:film)
    comment.user = Factory(:user)
    
    comment.should be_valid
  end  
end
