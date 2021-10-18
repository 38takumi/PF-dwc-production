json.array!(@events) do |event|
  json.extract! event, :id, :event_title, :event_description
  json.start event.event_start
  json.end event.event_end
  json.url event_url(event, format: :html)
end