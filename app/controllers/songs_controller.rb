class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
