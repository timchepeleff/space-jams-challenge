require 'csv'
require_relative 'album'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |track_row|

  album = albums.find { |a| a.id == track_row[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track_row[:album_id],
     track_row[:album_name],
     track_row[:artists])
    albums << album
  end

  track = Track.new(track_row[:album_id],
                      track_row[:track_id],
                      track_row[:title],
                      track_row[:track_number],
                      track_row[:duration_ms])
  # add the track to the album's @tracks instance variable
  album.add_tracks(track)

end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
