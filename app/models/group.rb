class Group
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :users
  has_many :goals
  
  field :name, :type => String
end