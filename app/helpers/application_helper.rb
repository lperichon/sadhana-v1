module ApplicationHelper
  def jeditable_field(object_name, field_name)
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
end
