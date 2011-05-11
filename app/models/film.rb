require 'open-uri'
require 'net/http'

class Film < ActiveRecord::Base
  before_validation :clean_url #this is the name of a private method
  validates_presence_of :name, :url, :description, :genre
  validates_numericality_of :rating, :greater_than => -1, :less_than => 6   
  belongs_to :genre

  has_many :comments, :dependent => :destroy
  
  has_attached_file :photo, :styles => {:medium => "300X300>", :thumb => "100X100>"}
  
  # handle_asynchronously :scrape_price

def scrape_price
    uri = URI.parse("http://#{self.url}")
    puts uri
    document = Nokogiri::HTML(open(uri))
    pounds = document.css('#pricePounds').text.scan(/\d+/)
    pence = document.css('#pricePence').text
    self.price = BigDecimal.new("#{pounds}.#{pence}")
    self.save!
end

handle_asynchronously :scrape_price

private
  def clean_url
    self.url.gsub!('http://', '') if self.url #self.url means it only runs this validation if there is a url
  end

end



# == Schema Information
#
# Table name: films
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  url                :string(255)
#  description        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  rating             :integer
#  genre_id           :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

