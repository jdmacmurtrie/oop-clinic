require_relative 'space_jams'
require_relative 'album'
require_relative 'track'

albums = []

TRACKS.each do |track|
  album = albums.find { |a| a.id == track[:album_id] }
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end
  album.tracks << Track.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])
end

albums.each do |album|
  puts album.summary
end
