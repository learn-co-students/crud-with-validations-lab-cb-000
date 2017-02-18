class SongsController < ApplicationController

  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all 
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(strong_params)  
    @song.valid? ? (redirect_to @song) : (render :new)
  end

  def show; end

  def edit; end

  def update
    @song.update(strong_params) ? (redirect_to @song) : (render :edit)    
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  
    def strong_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def find_song
      @song = Song.find(params[:id])   
    end      
end
