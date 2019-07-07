class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false], message: "Must be true or false" }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released

  validate :release_year_validations
  validate :no_duplicate_song_in_a_year

  def release_year_validations
    if released && release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def no_duplicate_song_in_a_year
    song = Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
    if song && song.id != id
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

end
