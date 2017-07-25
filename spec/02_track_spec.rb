require 'spec_helper'

RSpec.describe Track do
  describe '.new' do
    it 'takes an album id, track id, title, track number, and duration in milliseconds' do
      new_album = Track.new("1", "1", "Revolution 9", "1", "822000")
    end
  end

  let(:track_1) { Track.new("1", "1", "Revolution 9", "1", "822000") }

  describe "#id" do
    it 'has a reader for the track id' do
      expect(track_1.id).to eq("1")
    end
  end
  describe "#album_id" do
    it 'has a reader for the album id' do
      expect(track_1.album_id).to eq("1")
    end
  end

  describe "#title" do
    it 'has a reader for the title' do
      expect(track_1.title).to eq("Revolution 9")
    end
  end

  describe "#track_number" do
    it 'has a reader for the track number' do
      expect(track_1.track_number).to eq("1")
    end
  end

  describe "#duration_ms" do
    it 'has a reader for the duration in milliseconds' do
      expect(track_1.duration_ms).to eq("822000")
    end
  end

  describe '#titleize' do
    it 'makes the track pretty' do
      expect(track_1.titleize).to eq("1 - Revolution 9\n")
    end
  end
end
