class Song < ActiveRecord::Base
    validates :title, presence: true
    validate :release_year_if_released, :release_year_isnt_future, :unique_song_titles_each_year

    def release_year_if_released
        if self.released && !self.release_year
            errors.add(:release_year, "Release year required if released.")
        end
    end

    def release_year_isnt_future
        if self.release_year && self.release_year > Time.now.year
            errors.add(:release_year, "Release year can't be in the future.")
        end
    end

    def unique_song_titles_each_year
        song = Song.find_by(release_year: self.release_year, title: self.title)

        if song
            errors.add(:title, "You can't use the same title twice in one year.")
        end
    end
end
