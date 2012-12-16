function Message(channel, content){
  this.channel = channel;
  this.content = content;
}

var TextArea = {
  clear: function(){ $('textarea').val("") }
}

function MessageListModelView(){
  // Data
  var self = this;
  self.messages = ko.observableArray([]);

  self.newMessageContent = ko.observable("");
  // Operations
  self.addMessage = function(message){
    self.messages.push(message);
  };
  self.createMessage = function(){
    $.post('/messages', $('#new_message').serialize(), function(data){
      self.addMessage(data);
      TextArea.clear();
    }, 'json');
  }
  self.removeMessage = function(message){
    self.messages.remove(message);
  }
}

$(document).ready(function(){
  var mv = new MessageListModelView();

  $('.message').each(function(){
    channel = location.pathname.replace(/.+\W([a-zA-Z0-9]+)$/, '$1');
    $.getJSON("/messages?channel=" + channel, function(messages){
      for(var i = 0; i < messages.length; i++)
        mv.addMessage(messages[i]);
    });
    ko.applyBindings(mv);
  });

  $('textarea').on('keypress', function(event){
    var Key = {Enter: 13};
    if(!event.shiftKey && (event.which == Key.Enter || event.keyCode == Key.Enter)){
      $('form').trigger('submit');
    }
  });

  var channel = location.pathname.replace(/.+\W(\w+)$/, '$1');
  var pusher = new Pusher('4a0c86f04ddd676b60af');
  var connection = pusher.subscribe(channel);
  connection.bind('message', function(data) {
    mv.addMessage(data);
  });
});

