class Track
  attr_reader :id, :title, :duration, :track_number
  def initialize(id, title, track_number, duration)
    @id = id
    @title = title
    @duration = duration.to_i
    @track_number = track_number
  end

  def titleize
    "#{@track_number}) #{@title}\n"
  end
end
