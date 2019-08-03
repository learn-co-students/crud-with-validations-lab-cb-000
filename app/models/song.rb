class Song < ActiveRecord::Base
    validates :title, presence: { message: "Please enter a title" }
    validates :title, uniqueness: { message: "That title has already been used" }

    validates :released, inclusion: { in: [true, false], message: "Please enter 'true' or 'false'" }

    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, if: :released?, message: "Please enter a number less than or equal to #{Time.now.year}" }

    validates :artist_name, presence: { message: "Please enter an artist name" }
end
