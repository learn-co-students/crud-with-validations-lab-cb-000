class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: true


  #validate  :check_release_status
  #def check_release_status
  #  if released?
  #    validates :release_year, presence: true
  #    if release_year.present? && release_year > Date.today.year
  #      errors.add(:release_year, "must be les than or equal to current year")
  #    end
  #  end
  #end

  with_options if: :released? do |song|
   song.validates :release_year, presence: true
   song.validates :release_year, numericality: {
     less_than_or_equal_to: Date.today.year
   }
  end

  def released?
    puts "Released:#{released}"
    released
  end

end
