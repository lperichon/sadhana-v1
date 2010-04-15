module PracticeEventsHelper
  def js_event(event)
    %({
            id: #{event.id},
            title: '#{event.title}',
            start: new Date(#{event.start.strftime('%Y,%m - 1, %d, %H, %M')}),
            allDay: false
        })
  end
end
