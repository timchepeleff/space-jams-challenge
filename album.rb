
class Album
  attr_reader :id, :title, :artists
  attr_accessor :tracks
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    album_duration = 0
    tracks.each do |track|
      album_duration += track[:duration_ms].to_f / 60_000
    end
    album_duration.round(2)
  end

  def each_track
    each_track = ""
    tracks.each do |track|
      each_track << "\n- #{track[:title]}"
    end
    each_track
  end

  def summary
    <<-SUMMARY
\nName: #{title}
Artist(s): #{artists}
Duration (min.): #{duration_min}
Tracks: #{each_track}
    SUMMARY
  end

end
