module FacebookContactsHelper
  def fb_async_init
    output = content_tag(:div, '', :id => 'fb-root')
    output << javascript_tag do %(
  window.fbAsyncInit = function() {
    FB.init({appId: '#{ Facebooker2.app_id}', status: true, cookie: true,
             xfbml: true});
  };
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
      '//connect.facebook.net/en_US/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
)
    end
    output
  end
end

Facebooker2::Rails::Helpers::Javascript.module_eval do
  def fb_connect_async_js(app_id = Facebooker2.app_id, options = {}, &proc)
    options = Hash.new(true).merge!(options)
    callback = "null"
    if block_given?
      script = capture(&proc)
      callback = %(function() {
#{script}
})
    end

    script = <<-SCRIPT
<script type="text/javascript">
facebooker.connect('#{app_id}', #{options[:status]}, #{options[:cookie]}, #{options[:xfbml]}, #{callback});
</script>
SCRIPT
    script = fb_html_safe(script)
    block_given? ? concat(script) : script
  end
end