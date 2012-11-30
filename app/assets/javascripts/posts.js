function Post(avatar, username, date, distance, comment, actions){
  this.avatar = avatar;
  this.username = username;
  this.date = date;
  this.distance = distance;
  this.comment = comment;
  this.actions = actions;
}

function PostListModelView(){
  // Data
  var self = this;
  self.posts = ko.observableArray([]);

  self.newPostContent = ko.observable("");
  // Operations
  self.addPost = function(){
    $.post('/posts', $('#new_post').serialize(), function(data){
      self.posts.push(data);
    }, 'json');
  }
  self.removePost = function(post){
    self.posts.remove(post);
  }
}

$(document).ready(function(){
  mv = new PostListModelView();
  ko.applyBindings(mv);
});
