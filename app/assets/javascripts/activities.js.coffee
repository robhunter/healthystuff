window.activities = {
  
  create_activity: (formId) ->
    console.log('called')
    creator = new ActivityCreator
    creator.initialize(formId)
}

class ActivityCreator
  initialize: (formId) ->
    this.formId = formId
    this.form = $('#' + formId)
    this.userId = $('#user_id').val()
    date_array = $('#date').val().split('/')
    date = date_array[2] + '%2F' + date_array[0] + '%2F' + date_array[1]
    data = this.form.serialize() + "&datetime=" + date
    console.log(data)
    $.ajax({
      url:"/api/v1/activities/#{this.userId}/create"
      dataType: 'json'
      type: 'POST'
      data: data
    })