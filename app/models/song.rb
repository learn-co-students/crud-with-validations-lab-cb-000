class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released_is_true?
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released_is_true?
  validates :artist_name, presence: true

  def released_is_true?
    released
  end

end
