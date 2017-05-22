class AddIndexToSongs < ActiveRecord::Migration
  def change
    add_index :songs, %i(artist_name release_year title), unique: true
  end
end
