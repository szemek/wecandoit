function Post(avatar, username, date, distance, comment, actions){
  this.avatar = avatar;
  this.username = username;
  this.date = date;
  this.distance = distance;
  this.comment = comment;
  this.actions = actions;
}

var TextArea = {
  clear: function(){ $('textarea').val("") }
}

function PostListModelView(){
  // Data
  var self = this;
  self.posts = ko.observableArray([]);

  self.newPostContent = ko.observable("");
  // Operations
  self.addPost = function(post){
    self.posts.push(post);
  };
  self.createPost = function(){
    $.post('/posts', $('#new_post').serialize(), function(data){
      self.posts.push(data);
      TextArea.clear();
    }, 'json');
  }
  self.removePost = function(post){
    self.posts.remove(post);
  }
}

$(document).ready(function(){
  mv = new PostListModelView();
  $.getJSON("/posts", function(posts){
    for(var i = 0; i < posts.length; i++)
      mv.addPost(posts[i]);
  });
  ko.applyBindings(mv);
});
