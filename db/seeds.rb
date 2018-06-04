Song.destroy_all

Songs = [
  ["Shadow of the Day", true, 2007, "Linkin Park", "Alternative"],
  ["Eat It", true, 1984, "Weird Al", "Comedy"],
  ["Bored To Death", true, 2016, "Blink 182", "Alternative"],
  ["What's My Age Again?", true, 1999, "Blink 182", "Alternative"]
]

Songs.each do |title, released, release_year, artist_name, genre|
  Song.create(title: title, released: released, release_year: release_year, artist_name: artist_name, genre: genre)
end
