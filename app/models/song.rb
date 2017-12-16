class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }
    validate :unique_title_artist_year
    validate :release_year_validator
    
    private
        def unique_title_artist_year
            if Song.where("title = ? AND release_year = ?", title, release_year).exists?
                errors.add(:title, "cannot be released twice in the same year")
            end
        end
        
        def release_year_validator
           #binding.pry
            if released && release_year.blank?
                errors.add(:release_year, "cannot be blank if the song has been released")
            end
             if release_year && release_year > Date.today.year
                errors.add(:release_year, "must be equal to or less than the current year")
            end
           
        end
end
