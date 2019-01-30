class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.title = params[:song][:title]
    @song.artist_name = params[:song][:artist_name]
    @song.released = params[:song][:released]
    @song.release_year = params[:song][:release_year]
    @song.genre = params[:song][:genre]
    if @song.valid?
      @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find_by(id: params[:id]).destroy
    redirect_to songs_path
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  private

  def song_params
    params[:song].permit(:title, :genre, :artist_name, :released, :release_year)
  end

end
