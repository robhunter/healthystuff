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
    
  end

end