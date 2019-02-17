class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      flash[:notice] = "登録が成功しましt！"
      redirect_to artists_path
    else
      render "new"
    end
  end

  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    if artist.update(artist_params)
      flash[:notice] = "編集に成功しました！"
      redirect_to artists_path
    else
      render "edit"
    end
  end

  private

  def artist_params
     params.require(:artist).permit(:artist_name, :comment)
  end

end
