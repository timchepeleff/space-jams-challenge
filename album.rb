class Track
  attr_reader :album_id, :id, :title, :track_number, :duration_ms
  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end
end

class Album
  attr_reader :id, :title, :artists
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists

    @tracks = []
  end

  def add_tracks(track)
    @tracks << track
  end

  def duration_min
    album_duration = 0
    @tracks.each do |track|

      album_duration += track.duration_ms.to_f / 60_000
    end
    album_duration.round(2)
  end

  def each_track
    each_track = ""
    @tracks.each do |track|
      each_track << "- #{track.title}\n"
    end
    each_track
  end

  def summary
    <<-SUMMARY
\nName: #{title}
Artist(s): #{artists}
Duration (min.): #{duration_min}
Tracks:
#{each_track}
    SUMMARY
  end

end

