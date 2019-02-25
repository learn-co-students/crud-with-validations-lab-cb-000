class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "same artist cannot release a song in the same year with the same name"}
  validates :released, inclusion: {in: %w{true false} }
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: 2019}, if: :released
  validates :artist_name, presence: true
end
