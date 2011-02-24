$('head').append('<link href="http://xenda-jarvis.heroku.com/javascripts/jarvis.css" media="screen" rel="stylesheet" type="text/css" />');

$.getScript("http://js.pusherapp.com/1.7/pusher.min.js", function(){
	/*Pusher.log = function() {
      if (window.console) window.console.log.apply(window.console, arguments);
    };*/
	var pusher = new Pusher('90f6559f5192ab317c82');
	var channel = pusher.subscribe('xenda-jarvis-99714');
	
    channel.bind('create', function(data) {
    	pusher_message = '<div class="pusher_message">'+data.content+'</div>';
    	$('div.pusher_message').detach();
    	$('body').append(pusher_message);
    	$('div.pusher_message').live('click', function(){
    		$(this).detach();
    	});
    });
});