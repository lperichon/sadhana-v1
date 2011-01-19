
(function() {
  var f = new Object();

  f.connect = function(app_key, status, cookie, xfbml) {
    window.fbAsyncInit = function() {
      FB.init({ 'appId': app_key, 'cookie': cookie, 'status': status, 'xfbml': xfbml });
      FB.getLoginStatus(function(response) {
        if (response.session) {
          $(document).trigger('facebook.status');
        }
      });
      FB.Event.subscribe('facebook.login', function(/*response*/) {
        $(document).trigger('facebook.login');
      });
    };

    embed_script();
  };

  function embed_script() {
    var container = document.createElement('div');
    container.setAttribute('id','fb-root');

    var script = document.createElement('script');
    script.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
    script.async = true;

    document.documentElement.getElementsByTagName("body")[0].appendChild(container);
    container.appendChild(script);
  }

  f.login = function(path, permissions) {
    var url = document.location.protocol +
      '//' + document.location.host + path;

    FB.login(function(response) {
      if (response.session) {
        window.location = url;
      }
    }, permissions || {});
    return false;
  };

  f.logout = function(path) {
  	path = path || '/logout';
    FB.logout(function(response) {
      if (response) document.location = path;
    });
  };

  this.facebooker = f;
})();
