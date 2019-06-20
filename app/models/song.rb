class Song < ActiveRecord::Base
  

  # validate :artist_release_same_song_twice_in_a_year?
        
       
        
  
  #       def artist_release_same_song_twice_in_a_year?
          
        
  #         if release_year != nil
       
  #           errors.add(:artist_name, "can't release same song twice in a year")
  #         end
        
  #       end
  
      
      validates :title, uniqueness: true
        
      validates :title, presence: true
      
      validates :release_year, presence: true, if: :released?
      
    
      
        validate :release_date_cannot_be_in_the_future
        
        


  
  def released?
    released == true
  end
  
  
  
 
  def release_date_cannot_be_in_the_future

    if release_year 
    if (release_year > Date.today.year)
      errors.add(:release_year, "can't be in the future")
    end
    end
    
  
    
    
  end
 
  

end
