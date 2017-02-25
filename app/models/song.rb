class Song < ActiveRecord::Base
  validates :title, {presence: true, uniqueness: {scope: [:artist_name, :release_year]} }
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: true, inclusion: {in: (0..Time.now.year)}, if: :released
  
  # validate :unique_title_by_year?
  # validate :release_year_if_released?

  # def unique_title_by_year?
  #   if Song.all.any?{|s| s.release_year == release_year && s.title == title && s.artist_name == artist_name }
  #     errors.add(:title, "cannot be used by the same artist twice in the same year ")
  #   end
  # end

  # def release_year_if_released?
  #   # puts released
  #   # puts release_year
  #   errors.add(:release_year, 'must be filled in if song is released')
  # end

  # def release_year_not_future?
  #   unless release_year <= Time.now.year 
  #     errors.add(:release_year, 'must not be in the future')
  #   end
  # end
end
