class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :song_released?
  validates :artist_name, presence: true


  def song_released?
    self.released && self.release_year <= Time.now.year.to_i
  end
end
