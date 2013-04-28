class CompanyGrabber
  
  def self.bootstrap_companies
    self.get_entities(123)
    Company.all.each do |company|
      company.populate_info rescue "#{company.name} has a stupid name"
    end
  end
  
  def self.get_entities(page)
    response = HTTParty.get("http://api.crunchbase.com/v/1/companies.js?page=#{page}&api_key=#{Rails.configuration.crunchbase_key}")
    puts response.shift
    response.each do |company|
      c = Company.create(name:company['name'], category_code:company["category_code"], permalink:company["permalink"])
    end
  end
  
  def self.get_last_entries(pages)
    page = 123
    pages.times do |i|
      get_entities(page)
      page -= 1
    end
  end
  
end