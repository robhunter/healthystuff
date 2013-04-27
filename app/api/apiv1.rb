class Apiv1 < Grape::API
  version 'v1', path: true
  logger Rails.logger
  format :json
  
  helpers do

  end

  namespace :activities do
    
    post ':parent_id/create' do
      parent = User.where(id:params[:parent_id]).first || Group.where(id:params[:parent_id]).first
      activity = parent.activities.create(name:params[:name], 
        type:params[:type], 
        time:params[:datetime].to_datetime,
        name:params[:name],
        description:params[:description],
      )
      parent.save
      activity.to_json
    end
    
  end

end