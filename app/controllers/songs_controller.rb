class SongsController < ApplicationController
  before_action(:get_song, only: [:show, :edit, :update, :delete, :destroy])

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :'songs/new'
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :'songs/edit'
    end
  end

  def delete
    @song.delete
    redirect_to songs_path
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private 

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
