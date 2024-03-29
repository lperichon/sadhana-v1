module ApplicationHelper
  def jeditable_field(object_name, field_name, options = {})
    options.reverse_merge!({:type => 'text', :rows => '1'})
    object = options[:object] || self.instance_variable_get("@#{object_name}")
    field = object.send(field_name)
    output = content_tag(:span, field, {:id => "jeditable_#{dom_id object}_#{field_name}", :class => 'jeditable'})
    output << javascript_tag do %(
      $(document).ready(function() {
        $('#jeditable_#{dom_id object}_#{field_name}').editable(
            function(value, settings) {
              var result;
              $.ajax({
                type: 'PUT',
                url: '#{url_for(object)}' ,
                async: false,
                data: {
                  authenticity_token: #{form_authenticity_token.to_json },
                  wants: '#{field_name}',
                  '#{object_name}[#{field_name}]' : value
                },
                dataType: 'json',
                success: function(data) {
                  result = data.result;
                }
              });
              return(result);
            }, {
            type    : '#{options[:type]}',
            rows   : '#{options[:rows]}',
            width : 'none',
            tooltip   : ' #{t('application_helper.jeditable_tooltip')}',
            placeholder: '#{t('application_helper.jeditable_tooltip')}',
            style     : 'display: inline;',
            onedit    : function() {
              $(this).addClass('editing');
            },
            onblur   : function() {
              this.reset();
              $(this).removeClass('editing');
            }
        });
      });
      )
    end
    output
  end

  def field_help(help)
    content_tag :span, content_tag(:span, '(?)', :class=>'ui-icon ui-icon-help', :title => help), :class => 'ui-state-default ui-corner-all help'
  end

  # Shows language selection.
  def language_selection
    r = []
    I18n.backend.available_locales.each do |language_code|
      r << link_to_unless(I18n.locale == language_code, I18n.t('this_file_language', :locale => language_code) , params.merge(:locale => language_code)) + "&nbsp;"
    end
    r
  end

  def add_name_translation_link(name, form)
    link_to_function name do |page|
      translation = render(:partial => 'task', :locals => { :pf => form, :task => Task.new })
      page << %{
var new_task_id = "new_" + new Date().getTime();
$('tasks').insert({ bottom: "#{ escape_javascript task }".replace(/new_\\d+/g, new_task_id) });
}
    end
  end

  def practice_time(practice, details = true)
    s = ""
    hours = practice.total_time / 3600
    minutes = practice.total_time % 3600 / 60
    seconds = practice.total_time % 60
    s.concat t('practice.time_format', :hours => hours, :minutes => minutes, :seconds => seconds )
    if details
      s.concat " ("
      practice.practice_parts.each_with_index do |pp, i|
        s.concat ", " if i > 0
        s.concat "#{pp.part.name}: "
        s.concat "%02d:%02d" % [pp.total_time / 60, pp.total_time % 60]
      end
      s.concat ")"
    end
    s
  end
end
