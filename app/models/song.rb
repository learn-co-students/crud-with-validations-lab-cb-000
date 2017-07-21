class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :must_have_released_year_if_released
  validate :must_be_released_in_past
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]

  def must_have_released_year_if_released
    if released and !release_year
      errors.add(:release_year, "must have release_year if released")
    end
  end

  def must_be_released_in_past
    if release_year and (release_year > Time.now.year)
      errors.add(:release_year, "release_year must be in past")
    end
  end
end
