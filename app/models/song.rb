

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  # validates :release_year, inclusion: { in: 0..Date.today.year }
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validate :released_song_has_year?
  validate :song_year_correct?

  def released_song_has_year?
    if (released == true && !release_year.present?) || released == false
      errors.add(:release_year, "No release year")
    end
  end

  def song_year_correct?
    binding.pry
    if released == true
      if !0..Date.today.year.include?(release_year)
        errors.add(:release_year, "No release year")
      end
    end
  end

end
