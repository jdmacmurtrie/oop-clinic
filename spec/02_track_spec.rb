require 'spec_helper'

RSpec.describe Track do
  describe '.new' do
    it 'takes an id, title, duration, and track number' do
      new_track = Track.new("1", "I like to move it, move it", 33333, 1)
      expect(new_track).to be_a(Track)
    end
  end

  let(:track) {
    [
      {
        :album_id=>"1",
        :album_name=>"We Are One",
        :artists=>"Pitbull",
        :track_id=>"4pn0G7yHNfTgRYRWca8gYA",
        :title=>"We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]",
        :track_number=>"1",
        :duration_ms=>"222466"
      }
    ]
  }
  let(:new_track) { Track.new(track[0][:track_id], track[0][:title], track[0][:track_number],track[0][:duration_ms]) }

  describe '#id' do
    it 'has a reader for the track id' do
      expect(new_track.id).to eq("4pn0G7yHNfTgRYRWca8gYA")
    end
  end

  describe '#title' do
    it 'has a reader for the track title' do
      expect(new_track.title).to eq("We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]")
    end
  end

  describe '#duration' do
    it 'has a reader for the track duration' do
      expect(new_track.duration).to eq(222466)
    end
  end

  describe '#track_number' do
    it 'has a reader for the track number' do
      expect(new_track.track_number).to eq("1")
    end
  end

  describe '#titleize' do
    it 'makes the track listing look pretty' do
      expect(new_track.titleize).to eq("1) We Are One (Ole Ola) [The Official 2014 FIFA World Cup Song]\n")
    end
  end
end
