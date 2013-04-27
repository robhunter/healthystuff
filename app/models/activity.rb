class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_one :user
  
  field :name, :type => String
  field :upvotes, :type => Integer, :default => 0
  field :downvotes, :type => Integer, :default => 0
end