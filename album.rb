require 'pry'
class Album
  attr_reader :id, :album_name, :artists, :tracks, :duration
  def initialize(id, album_name, artists)
    @id = id
    @album_name = album_name
    @artists = artists
    @tracks = []
  end

  def duration
    time = 0
    @tracks.each do |track|
      time += track.duration_ms.to_i
    end
    Time.at(time/1000).strftime("%H:%M")
  end

  def track_list
    result = ''
    @tracks.each do |track|
      result += track.titleize
    end
    result
  end

  def summary
    "Name: #{album_name}\nArtist(s): #{artists}\nDuration (min.): #{duration}\nTracks: \n#{track_list}"
  end
end
