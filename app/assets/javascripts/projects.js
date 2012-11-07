$(document).ready(function(){
  $('.project-box').each(function(index, elem){
    id = $(elem).attr('data-project')

    $.get('/projects/' + id + '/details', function(data){
      gravatar = data['gravatar'].split('?')[0] + '?s=100&d=' + window.location.origin + '/assets/logos/octocat.png'
      $(elem).find('img').attr('src', gravatar)
      $(elem).find('.description span').text(data['description'])
      $(elem).find('.last-commit-message span').text(data['last_commit_message'])
      $(elem).find('.last-commit-date span').text(data['last_commit_date'])

      $.post('/projects/' + id, {
          _method: 'PUT',
          project: {
            description: data['description'],
            last_commit_message: data['last_commit_message'],
            last_commit_date: data['last_commit_date'],
            gravatar: data['gravatar']
          }
      });
    })
  })
})
