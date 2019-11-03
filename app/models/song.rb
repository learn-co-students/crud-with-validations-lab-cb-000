class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :genre, presence: true 
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: :current_year }
  validates :title, :release_year, uniqueness: true

  def released?
    released
  end

  def current_year
    Date.today.year
  end
end
