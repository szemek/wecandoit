function Post(avatar, username, date, distance, comment){
  this.avatar = avatar;
  this.username = username;
  this.date = date;
  this.distance = distance;
  this.comment = comment;
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
  mv.addPost(new Post(
    "/assets/logos/octocat.png",
    "szemek",
    "14 lis 2012, o 20:23",
    "1 minuta temu",
    "Hello world!"
  ));
  ko.applyBindings(mv);
});
