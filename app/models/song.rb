class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {

    scope: [:release_year, :artist_name],
    message: "Cannot be repeated by the same artist in the same year."
  }
  validates :released, inclusion: {in: [true,false]}
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates  :release_year, presence: true, release_year: true
  end



  def released?
    self.released
  end

end
