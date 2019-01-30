class Song < ApplicationRecord
  validates :title, presence: true

  validates :released, inclusion: [true, false]
  validates :artist_name, presence: true

    validate :repeat?
    validate :year?

  def repeat?
    if Song.find_by(artist_name: artist_name, title: title, release_year: release_year) != nil
      errors.add(:title, "Title already used by this artist in this year")
    end
  end

  def year?
    if released == true && release_year == nil
      errors.add(:release_year, "Must have a release year if released == true")
    elsif release_year.to_i > Time.now.year
      errors.add(:release_year, "Release year must be less than or equal to current year")
    end
  end

end
