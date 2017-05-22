class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :released, inclusion: { in: [true, false], message: 'Most be an boolean value.' }
  validates :release_year, numericality: { less_than_or_equal_to:  Date.today.year } , if: :released
end
