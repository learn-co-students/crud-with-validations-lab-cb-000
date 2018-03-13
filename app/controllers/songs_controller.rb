class SongsController < ApplicationController

  def new
    @song = Song.new #new song page
  end

  def show
        @song = Song.find(params[:id]) #render show page, find song by id
  end

  def edit
    @song = Song.find(params[:id]) #render edit page, find song by id
  end

  def index
    @songs = Song.all #shows all songs
  end

  def create
     @song = Song.new(song_params) #create a new song
     if @song.save #save it
       redirect_to @song #redirect to songs
     else
       render :new #otherwise back to new page
     end
   end

   def update
   @song = Song.find(params[:id])
   if @song.update(song_params)
     redirect_to @song
   else
     render :edit
   end
  end

  def destroy
     @song = Song.find(params[:id])
     @song.destroy
     redirect_to songs_url
   end

   private #this is private because user shouldnt be able to edit this method

   def song_params #these are the parameters for someone inputting a new song
     params.require(:song).permit(
       :title, :release_year, :released, :genre, :artist_name
     )
   end
 end
