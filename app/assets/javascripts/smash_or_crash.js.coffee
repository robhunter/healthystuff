window.smash_or_crash = {
  
  createSmasher: () ->
    console.log('smasher online')
    smasher = new Smasher
    smasher.initialize()
}

window.companies = []

class Smasher
  initialize: () ->
    this.companies = []
    this.pointer = 0
    this.image = $('#company-image')
    this.overview = $('#company-overview')
    this.upvote = $('#upvote')
    this.downvote = $('#downvote')
    this.title = $('#company-title')
    this.image_link = $('#image-link')
    this.title_link = $('#title-link')
    this.upvote.bind('click', this.castUpvote)
    this.downvote.bind('click', this.castDownvote)
    this.get_more(true)
    $(document).bind('keydown', this.onKeyPress)
  get_more: (init) =>
    $.ajax({
      url:"api/v1/companies/with_images"
      dataType: 'json'
      type: 'GET'
      success: (value) =>
        console.log(value)
        $.each(value, (index, value) -> 
          window.test = value
          image = value.image.available_sizes[value.image.available_sizes.length - 1 ][1]
          overview = value.overview
          window.companies.push({
            image:image
            overview:overview
            slug:value.slug
            link:value.tc_homepage_url
            title:value.name
            })
        );
        if init
          this.loadCompany()
    })
  company: () =>
    window.companies[this.pointer]
  onKeyPress: (key) =>
    console.log(key)
    if (key.keyCode == 39 || key.keyCode == 68)
      console.log('RIGHT')
      this.nextCompany()
    else if (key.keyCode == 37 || key.keyCode == 65)
      console.log('LEFT')
      this.previousCompany()
  nextCompany: () =>
    if this.pointer < window.companies.length - 1
      this.pointer += 1
      this.loadCompany()
      console.log(this.pointer)
  previousCompany: () =>
    if this.pointer > 0
      this.pointer -= 1
      this.loadCompany()
      console.log(this.pointer)
  loadCompany: () =>
    this.image.attr('src', 'http://crunchbase.com/' + window.companies[this.pointer].image)
    this.overview.html(window.companies[this.pointer].overview)
    this.title.html(this.company().title)
    this.title_link.attr('href', this.company().link)
    this.image_link.attr('href', this.company().link)
  castUpvote: () =>
    $.ajax({
      url:"api/v1/companies/#{this.company().slug}/upvote"
      dataType: 'json'
      type: 'POST'
      success: (value) ->
        console.log(value)
    })
  castDownvote: () =>
    $.ajax({
      url:"api/v1/companies/#{this.company().slug}/downvote"
      dataType: 'json'
      type: 'POST'
      success: (value) ->
        console.log(value)
    })
    