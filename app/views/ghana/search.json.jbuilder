json.hows do
  json.array!(@hows) do |how|
    json.name how.name
    json.url how_path(how)
  end
end

json.events do
  json.array!(@events) do |event|
    json.name event.name
    json.url event_path(event)
  end
end