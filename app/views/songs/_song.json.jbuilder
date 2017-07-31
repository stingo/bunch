json.extract! song, :id, :title, :description, :songcover, :audio, :lyricstitle, :lyricsbody1, :lyricschorus1, :lyricsbody2, :lyricschorus2, :lyricsbody3, :lyricschorus3, :youtubeurl, :slug, :created_at, :updated_at
json.url song_url(song, format: :json)
