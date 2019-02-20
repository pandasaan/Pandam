class Admin::ArtistsController < ApplicationController
  # before_action :authenticate_admin!
  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      flash[:notice] = "アーティストを新規登録しました！"
      redirect_to admin_artists_path
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
      flash[:notice] = "編集が完了しました！"
      redirect_to artists_path
    else
      render "edit"
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    flash[:notice] = "削除しました"
    redirect_to artists_path
  end

  private

  def artist_params
     params.require(:artist).permit(:artist_name, :comment)
  end

end
