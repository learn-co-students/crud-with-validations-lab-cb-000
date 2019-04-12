class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness:  { scope: :release_year,
    message: "Can only release a title once a year" }
  validates :released, inclusion: { in: [true, false],
    message: "must be true or false" }
  validates :artist_name, presence: true
  
  
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year  }
  end
 
    
end
