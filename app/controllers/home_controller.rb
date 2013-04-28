class HomeController < ApplicationController
  
  def index
    company = Company.with_image.offset(rand(Company.with_image.count)).limit(1).first
    @overview = company.overview || ""
    @image = "http://crunchbase.com/#{company.image["available_sizes"].last.last}" rescue nil
    @name = company.name
  end

  def vote
    company = Company.where(name: params[:company]).first
    company.vote(params[:type])
    redirect_to '/'
  end

  def leaderboard
    @companies = Company.desc(:score).limit(25)
  end
  
end
