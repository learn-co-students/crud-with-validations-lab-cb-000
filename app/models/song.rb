class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year, :artist_name,
    message: "Same title cannot occur more than once in the same year by the same artist" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }, if: :released?
  validates :artist_name, presence: true
end
