class CompanyGrabber
  
  def collect_companies
    
  end
  
  def get_entities(page)
    response = HTTParty.get("http://api.crunchbase.com/v/1/companies.js?page=#{page}&api_key=#{Rails.configuration.crunchbase_key}")
    puts response.shift
    response.each do |company|
      c = Company.create(name:company['name'], category_code:company["category_code"], permalink:company["permalink"])
    end
  end
  
  def get_last_entries(pages)
    page = 123
    pages.times do |i|
      get_entities(page)
      page -= 1
    end
  end
  
end