class HomeController < ApplicationController
  
  def index
    @image = "http://crunchbase.com/#{Company.first.image["available_sizes"].last.last}"
    @overview = Company.first.overview 
  end
  
end
