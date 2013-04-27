require 'pry'
class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :foursquare
  
  def show
    @user = current_user
  end

  def foursquare
    current_user.fsq_at = env['omniauth.auth']['credentials']['token']
    current_user.fsq_data = env['omniauth.auth']
    current_user.save!

    redirect_to '/me'
  end
  
end
