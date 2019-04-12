class SongsController < ApplicationController
   def index
    @songs = Song.all
  end
  def show
    @song = Song.find(params[:id])
  end
  def new
    @song = Song.new
  end
  def create
    @song = Song.new(song_params)
    if @song.save
    redirect_to @song
   else 
    render :new
  end
  end
  
  def edit
   @song = Song.find(params[:id])
  end
  def update
    @song = Song.find(params[:id])
    @song.update(post_params(:name, :location))
    redirect_to song_path(@song)
  end
 
  private
  
  def find_song_id
   Songr.find(params[:id])
  end
  def song_params
     params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    )
  end

end
