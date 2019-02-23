class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:notice] = "ジャンルを新規登録しました！"
      redirect_to admin_genres_path
    else
      render "new"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      flash[:notice] = "編集が完了しました！"
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  def index
    @search = Genre.ransack(params[:q])
    @search_genres = @search.result.page(params[:page])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:genre)
  end
end
