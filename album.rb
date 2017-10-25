require_relative 'track'

class Album
  attr_reader :id, :album_name, :artists, :tracks

  def initialize(album_id, album_name, artists)
    @id = album_id
    @album_name = album_name
    @artists = artists
    @tracks = []
  end

  def duration
    total_duration = 0
    @tracks.each do |track|
      total_duration += track.duration
    end
    seconds = total_duration/1000
    Time.at(seconds).strftime("%H:%M:%S")
  end

  def track_list
    result = ''
    @tracks.each do |track|
      result += track.titleize
    end
    result
  end

  def summary
    "Name: #{album_name}\nArtist(s): #{artists}\nDuration: #{duration}\nTracks:\n#{track_list}"
  end
end
