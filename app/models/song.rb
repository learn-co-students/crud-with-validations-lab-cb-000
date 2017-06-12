class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: [true, false, nil]}
  validates :release_year,
            presence: true,
            numericality: {less_than_or_equal_to: Time.current.year},
            if: "released == true"
end
