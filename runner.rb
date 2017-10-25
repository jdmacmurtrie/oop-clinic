require_relative 'space_jams'
require_relative 'album'

albums = []

TRACKS.each do |track|
  album = albums.find { |a| a.id == track[:album_id] }
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end
  album.tracks << track
end

albums.each do |album|
  puts album.summary
end
