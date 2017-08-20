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

  json.songs do
  json.array!(@songs) do |song|
    json.name song.title
    json.url song_path(song)
  end
end

  json.urbanterms do
  json.array!(@urbanterms) do |urbanterm|
    json.name urbanterm.title
    json.url urbanterm_path(urbanterm)
  end
end

  json.profiles do
  json.array!(@profiles) do |profile|
    json.name profile.full_name
    json.url profile_path(profile)
  end
end