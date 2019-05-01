class Song < ActiveRecord::Base
  validates :title, presence: true #the title must be present
  validates :title, uniqueness: { #the title must be unique to the artist name and release year
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] } #was the song released?
  validates :artist_name, presence: true #artist name must be present

  with_options if: :released? do |song| #if the song was released
    song.validates :release_year, presence: true #then it must have a release year
    song.validates :release_year, numericality: { #and the release year cannot be in the future
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
end
