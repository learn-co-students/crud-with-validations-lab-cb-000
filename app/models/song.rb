class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, release_year: true


  def released?
    self.released
  end

end
