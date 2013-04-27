require 'pry'
require 'json'
class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:foursquare, :checkin]
  
  def show
    @user = current_user
  end

  def foursquare
    current_user.fsq_at = env['omniauth.auth']['credentials']['token']
    current_user.fsq_data = env['omniauth.auth']
    current_user.fsq_checkins = JSON.parse(Typhoeus.get("https://api.foursquare.com/v2/users/self/checkins", params: {oauth_token: current_user.fsq_at}).body)["response"]
    current_user.save!

    redirect_to '/me'
  end

  def checkin
    Rails.logger.info(params)
  end
  
end
