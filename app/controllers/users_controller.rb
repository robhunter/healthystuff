require 'pry'
class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :foursquare
  
  def show
    @user = current_user
  end

  def foursquare
    binding.pry
    fs = env['omniauth.auth']
    token = fs['credentials']['token']

    render inline: "Sup"
  end
  
end
