class HomeController < ApplicationController
  
  def index
    company = Company.offset(rand(Company.count)).limit(1).first
    @overview = company.overview || ""
    @image = "http://crunchbase.com/#{company.image["available_sizes"].last.last}" rescue nil
    @name = company.name
  end
  
end
