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
  this.posts = ko.observableArray([]);
  // Operations
  this.addPost = function(post){
    this.posts.push(post);
  }
  this.removePost = function(post){
    this.posts.remove(post);
  }
}

$(document).ready(function(){
  mv = new PostListModelView();
  $.getJSON("/posts", function(posts){
    for(i in posts)
      mv.addPost(posts[i]);
  });
  ko.applyBindings(mv);
});
