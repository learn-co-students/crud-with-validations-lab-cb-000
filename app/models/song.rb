class Song < ActiveRecord::Base
  validates :title, presence: :true
  validates :release_year, presence: :true, if: :released
  validate :released_in_future?
  validate :same_year_release?

  def released_in_future?
    if release_year
      if release_year > Time.now.year
        errors.add(:release_year, "Can't be in the future")
      end
    end
  end

  def same_year_release?
    song = Song.find_by(title: title)
    if song && song.released && song.artist_name == artist_name && song.title == title &&
      song.release_year == release_year && song.genre == genre
        errors.add(:title, 'You released that this year!')
    end
  end
end
