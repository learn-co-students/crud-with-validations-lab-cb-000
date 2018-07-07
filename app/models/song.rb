class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :title_is_unique_to_release_year
  validate :release_year_if_released
  validates :artist_name, presence: true

  def title_is_unique_to_release_year
    if released && Song.find_by_release_year(release_year)
      errors.add(:title, "must be unique to the year released")
    end
  end

  def release_year_if_released
    if released && [nil, 0, ""].any?{|i| i == release_year}
      errors.add(:release_year, "can't be blank if the song is released")
    elsif released && release_year > Time.now.year
      errors.add(:release_year, "can't be greater than the current year")
    end
  end

end
