class Apiv1 < Grape::API
  version 'v1', path: true
  logger Rails.logger
  format :json
  
  helpers do

  end

  namespace :companies do
    
    get 'with_images' do
      page = params[:page] || 0
      Company.with_image.limit(100).skip(page * 100).entries
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