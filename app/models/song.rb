# rails g resource Song title:string released:boolean release_year:integer  artist_name:string genre:string --no-test-framework --no-assets --no-helper
class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :title_is_unique_to_release_year
  validate :release_year_if_released
  validates :artist_name, presence: true

  def title_is_unique_to_release_year
    if released && Song.find_by(release_year: release_year, title: title) && Song.find_by(release_year: release_year, title: title) != self
      errors.add(:title, "must be unique to the year released")
    end
  end

  def release_year_if_released
    if released
      if !release_year || release_year == 0
        errors.add(:release_year, "can't be blank if the song is released")
      elsif release_year > Time.now.year
        errors.add(:release_year, "can't be greater than the current year")
      end
    end
  end

end
