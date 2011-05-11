require File.dirname(__FILE__) + '/../spec_helper'

describe Genre do
  it "should not be valid without a name" do
    Genre.new.should_not be_valid
  end
  
  it "should be valid with a name" do
    Genre.new(:name => 'Test').should be_valid
  end 
  
  it "should destroy all films that belong to this genre when deleting it" do
    genre = Genre.create!(:name => 'horror')
    genre.films.create!(:name => 'test', :url => 'test', :rating => 2, :description => 'test')
    
    lambda do
      genre.destroy
    end.should change(Film, :count).by(-1)  
  end 
end
