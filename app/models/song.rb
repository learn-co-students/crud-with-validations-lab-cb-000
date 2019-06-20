class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "Song with the same title should be released in a different year."}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validates :released, inclusion: { in: [true, false] }
  validate :year_restriction

  def year_restriction
    if (release_year != nil) && (release_year > Date.today.year)
      errors.add(:year_restriction, "Date can't be in the future!")
    end
  end

end
