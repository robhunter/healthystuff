class Goal
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  belongs_to :group
  
  field :name, :type => String
end