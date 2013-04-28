class HomeController < ApplicationController
  
  def index
    company = Company.with_image.offset(rand(Company.with_image.count)).limit(1).first
    @overview = company.overview || ""
    @image = "http://crunchbase.com/#{company.image["available_sizes"].last.last}" rescue nil
    @name = company.name
  end
  
end
