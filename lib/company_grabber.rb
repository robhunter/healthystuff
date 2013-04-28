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
  
  def self.get_adaptly
    a = Company.create(name:"Adapt-ly", category_code:nil, permalink:"adaptly")
    a.populate_info rescue "#{company.name} has a stupid name"
    a.name = "Adaptly"
    g = Company.create(name:"Genes and Us", category_code:nil, permalink:"genes-and-us")
    g.overview = "<p>Genes and Us helps families understand how their genetics affect their health.<br><br>Couples can connect their 23andMe accounts to understand what traits they'll pass on to their children - their good genes and their bad genes, the traits that they'll definitely pass on and the traits that they may or may not pass on.</p>"
    g.image = {"available_sizes"=>[[[150, 35], "assets/images/resized/0000/2812/2812v1-max-150x150.png"], [[200, 47], "assets/images/resized/0000/2812/2812v1-max-250x250.png"], [[200, 47], "http://www.genesand.us/assets/square_logo.png"]], "attribution"=>nil} 
    g.write_attribute('tc_homepage_url', "http://www.genesand.us")
    g.write_attribute('tc_crunchbase_url', 'genes-and-us')
    
    g.save
    a.save
    87.times do |t|
      g.vote('up')
    end
    72.times do |t|
      a.vote('up')
    end
  end
  
end