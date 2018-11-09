class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false] }
    with_options if: :is_released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than: Date.today.year }
    end

    def is_released?
        released
    end
end
