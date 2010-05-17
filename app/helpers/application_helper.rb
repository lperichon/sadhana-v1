module ApplicationHelper
  def jeditable_field(object_name, field_name, options = {})
    options.reverse_merge!({:type => 'text', :rows => '1'})
    object = self.instance_variable_get("@#{object_name}")
    field = object.send(field_name)
    output = content_tag(:span, field, {:id => "jeditable_#{field_name}", :class => 'jeditable'})
    output << javascript_tag do %(
      $(document).ready(function() {
        $('#jeditable_#{field_name}').editable(
            function(value, settings) {
              var result;
              $.ajax({
                type: 'PUT',
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
            tooltip   : ' Click to edit...',
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
end
