class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence:true
  validates :release_year, presence: true, :if => :released?
  validates :release_year, numericality: { less_than_or_equal_to: 2017, only_integer:true}, :if => :released?
  validates :title, uniqueness: { scope: :release_year}
# Song is invalid if an artist tries to release the same song twice in a year


  def released?
    released == true
  end
end
