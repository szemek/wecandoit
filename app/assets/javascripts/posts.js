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
    $('.comment').emoticonize();
  };
  self.createPost = function(){
    $.post('/posts', $('#new_post').serialize(), function(data){
      self.addPost(data);
      TextArea.clear();
    }, 'json');
  }
  self.removePost = function(post){
    self.posts.remove(post);
  }
}

$(document).ready(function(){
  $('.posts').each(function(){
    mv = new PostListModelView();
    $.getJSON("/posts", function(posts){
      for(var i = posts.length - 1; i >= 0; i--)
      mv.addPost(posts[i]);
    });
    ko.applyBindings(mv);
  });
});
