class Song < ActiveRecord::Base
  validates :title, presence: true


  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Date.today.year}
  validates :title, uniqueness: true

  def released?
    released
  end


end
