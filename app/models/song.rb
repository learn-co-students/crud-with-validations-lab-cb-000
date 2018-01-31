class Song < ActiveRecord::Base
  validates :title, presence: {message: "Enter a title"}, uniqueness: {message: "That title has already been used"}
  validates :released, inclusion: {in: [true, false], message: "Enter 'true' or 'false'"}
  validates :release_year, presence: true, if: :released?, inclusion: {in: 100..Date.today.year, message: "Enter a number less than or equal to #{Time.now.year}"}
  validates :artist_name, presence: {message: "Enter an artist name"}
end
