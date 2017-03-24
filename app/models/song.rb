class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validate :future_release?, :rerelease_in_same_year, on: :create

  private

  def future_release?
    if release_year
      errors.add(:release_year, "cannot be a future date") unless release_year < Time.now.year
    end
  end

  def rerelease_in_same_year
    songs = Song.all.collect {|song| song.release_year if song.title == title}
    if songs != nil
      errors.add(:release_year, "this song cannot be released more than once in the same year") unless
        !songs.include?(release_year)
    end
  end
end
