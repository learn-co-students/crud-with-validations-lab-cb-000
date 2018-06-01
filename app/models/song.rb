class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than: Time.new.year}, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true ? true:false
  end
end
