class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year],
                                                  message: "%{value} already exists for artist and year"}
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  with_options if: :released do |rel|
    rel.validates :release_year, presence: true
    rel.validates :release_year, numericality: { less_than_or_equal_to: 2017 }
  end
  validates :artist_name, presence: true

end
