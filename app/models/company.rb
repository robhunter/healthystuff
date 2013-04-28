class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :description, :type => String
  field :founded_at, :type => Date
  field :url, :type => String
  field :category_code, :type => String
  field :image, :type => Hash
  field :overview, :type => String
end