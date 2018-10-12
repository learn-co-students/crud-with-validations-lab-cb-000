class Song < ActiveRecord::Base
  include ActiveModel::Validations
  
  validates_with ReleaseYearPresenceValidator
  validates :title, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, allow_nil: true }
  validates :artist_name, presence: true
  validates :genre, presence: true
  validate :song_uniqueness
  
  private
  
  def song_uniqueness
    song = Song.find_by(title: title, release_year: release_year, artist_name: artist_name)
    
    if song && song.id != self.id
      errors.add(:title, "- Same song cannot be released by the same artist in the same year")
    end
  end
end
