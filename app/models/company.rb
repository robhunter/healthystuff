class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String
  field :founded_at, type: Date
  field :url, type: String
  field :category_code, type: String
  field :image, type: Hash
  field :overview, type: String
  field :upvotes, type: Integer
  field :downvotes, type: Integer
  
  def self.populated
    where(:tc_crunchbase_url.ne => nil)
  end
  
  def populate_info
    my_info.each do |key, value|
      if ["url", "image", "overview"].include?(key)
        self.write_attribute(key, value)
      else
        self.write_attribute("tc_#{key}", value)
      end
    end
    self.save
  end
  
  def my_info
    response = HTTParty.get("http://api.crunchbase.com/v/1/company/#{URI.encode(name)}.js?api_key=#{Rails.configuration.crunchbase_key}")
  end
  
end
