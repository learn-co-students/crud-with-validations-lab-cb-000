class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: [true, false]
  validates :artist_name, presence: true
  validate :release_year_present_if_released
  validate :release_year_less_than_or_equal_to_current_year

  def release_year_present_if_released
    if released && release_year == nil
      errors.add(:release_year, "can't be nil if released")
    end
  end

  def release_year_less_than_or_equal_to_current_year
    if release_year != nil && release_year > Time.now.year
      errors.add(:release_year, "can't be set past current year")
    end
  end
end
