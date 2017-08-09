class Song < ActiveRecord::Base
  validates_presence_of [:title, :artist_name]
  validates :released, :inclusion => {:in => [true, false]}

#custom validations
  validate :unique_for_artist_at_same_year
  validate  :valid_release_year


 def valid_release_year
   if self.released && !self.release_year.present?
     errors[:release_year] << "can't be blank"
   elsif self.release_year.present?
     errors[:release_year] << "should be less than or equal to the current year" if  self.release_year > Date.today.year
   end

 end

  def unique_for_artist_at_same_year
    if song = Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
      errors[:title] << "Song cannot be repeated for the same artist at the same year" unless song.id == self.id 
    end
  end

end
