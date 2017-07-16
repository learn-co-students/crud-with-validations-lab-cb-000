class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false],
    message: "%{released} is not valid, must be 'true' or 'false'"}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :is_released?
  validate :release_year_must_be_less_or_equal_to_current_year
  validate :title_uniq_by_artist_and_year


  def title_uniq_by_artist_and_year
    found = Song.where(title: title, artist_name: artist_name, release_year: release_year)

    if !found.empty?
      errors.add(:title, "already exist for this artist")
    end
  end

  def is_released?
    released == true
  end

  def release_year_must_be_less_or_equal_to_current_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "year cannot be greater than current year")
    end
  end
end
