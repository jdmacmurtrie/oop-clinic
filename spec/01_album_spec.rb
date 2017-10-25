require 'spec_helper'

RSpec.describe Album do
  describe '.new' do
    it 'takes an id, name, and list of artists' do
      new_album = Album.new("1", "the White Album", "The Beatles")
      expect(new_album).to be_a(Album)
    end
  end

  let(:tracks)  {
    [
      {
        :album_id=>"1",
        :album_name=>"We Are One",
        :artists=>"Pitbull",
        :track_id=>"4pn0G7yHNfTgRYRWca8gYA",
        :title=>"We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]",
        :track_number=>"1",
        :duration_ms=>"222466"
      },
      {
        :album_id=>"1",
        :album_name=>"A13",
        :artists=>"Garnier",
        :track_id=>"4TodN6on0egMGf46YPk5oZ",
        :title=>"Revenge of the Lol Cat",
        :track_number=>"2",
        :duration_ms=>"200687"
      }
    ]
  }
  let(:new_album) { Album.new(tracks[0][:album_id], tracks[0][:album_name], tracks[0][:artists]) }

  describe '#id' do
    it 'has a reader for the album id' do
      expect(new_album.id).to eq("1")
    end
  end

  describe '#album_name' do
    it 'has a reader for the album name' do
      expect(new_album.album_name).to eq("We Are One")
    end
  end

  describe '#artists' do
    it 'has a reader for the artists' do
      expect(new_album.artists).to eq("Pitbull")
    end
  end

  describe '#tracks' do
    it 'has a reader for the track array' do
      expect(new_album.tracks).to eq([])
    end
  end

  describe '#duration' do
    it 'calculates the duration of the album in hh:mm:ss' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:track_number], track[:duration_ms])
      end
      expect(new_album.duration).to eq("19:07:03")
    end
  end

  describe '#track_list' do
    it 'displays each track in a readable string' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:track_number], track[:duration_ms])
      end

      expect(new_album.track_list).to eq("1) We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]\n2) Revenge of the Lol Cat\n")
    end
  end

  describe '#summary' do
    it 'lists out all tracks in an album' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:track_number], track[:duration_ms])
      end
      expect(new_album.summary).to eq("Name: We Are One\nArtist(s): Pitbull\nDuration: 19:07:03\nTracks:\n1) We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]\n2) Revenge of the Lol Cat\n")
    end
  end
end
