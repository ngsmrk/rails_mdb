class SearchController < ApplicationController
  def create
    search = "%#{params[:search_for]}%"
    # #{} is include in string
    @films = Film.find(:all, :conditions => ['name LIKE ?', search])
  end
  
end