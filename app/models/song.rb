class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  with_options if: :is_released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than: Date.today.year}
  end

  def is_released?
    self.released == true
  end

end
