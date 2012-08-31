$(document).ready(function(){
  $('.project-box').each(function(index, elem){
    id = $(elem).attr('data-project')

    $.get('/projects/' + id + '/details', function(data){
      $(elem).find('.description span').text(data['description'])
      $(elem).find('.last-commit-message span').text(data['last_commit_message'])
      $(elem).find('.last-commit-date span').text(data['last_commit_date'])
    })
  })
})
