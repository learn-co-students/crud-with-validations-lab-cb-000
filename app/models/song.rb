class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :already_released?
  validates :release_year, numericality: {less_than_or_equal_to: Time.new.year.to_i}, if: :already_released?
  validates :title, uniqueness: {scope: :release_year}

def already_released?
  released == true
end







end
