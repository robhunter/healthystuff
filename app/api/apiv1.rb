class Apiv1 < Grape::API
  version 'v1', path: true
  logger Rails.logger
  format :json
  
  helpers do

  end

  namespace :companies do
    
    get 'with_images' do
      page = params[:page] || rand((Company.with_image.count - 100).floor)
      Company.with_image.limit(100).skip(page).entries
    end
    
    post ':slug/upvote' do
      company = Company.where(slug:params[:slug]).first
      company.vote('up')
    end
    
    post ':slug/downvote' do
      company = Company.where(slug:params[:slug]).first
      company.vote('down')
    end
    
  end

end