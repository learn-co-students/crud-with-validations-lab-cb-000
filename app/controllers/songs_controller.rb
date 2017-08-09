class SongsController < ApplicationController

  def index #=> get '/songs'
   @songs = Song.all
   render :index
  end

  def show #=> get '/songs/:id'
   @song = Song.find(params[:id])
   render :show
  end


  def new #=> get '/songs/new'
   @song = Song.new
   render :new
  end

  def create #=> post '/songs'
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song.id)
    else
      render :new
    end
  end

  def edit # get '/songs/:id/edit'
    @song = Song.find(params[:id])
    render :edit
  end

  def update  #=> patch '/songs/:id'
    @song = Song.find_by(:id => params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end

  def destroy #=> delete 'songs/:id'
    song = Song.find_by(id: params[:id])
    song.delete
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year)
  end

end
