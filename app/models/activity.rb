class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  field :name, :type => String
  field :description, :type => String
  field :type, :type => String # in [meal, exercise]
  field :time, :type => DateTime
  field :upvotes, :type => Integer, :default => 0
  field :downvotes, :type => Integer, :default => 0
  
end