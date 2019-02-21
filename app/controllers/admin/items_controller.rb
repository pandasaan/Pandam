class Admin::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  def new
    @item = Item.new
    @disc = @item.discs.build
    @tune = @disc.tunes.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    # 一覧は複数形の方がいいので@item → @itemsに変更しました
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end



  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :stock, :artist_id, :label_id, :genre_id, discs_attributes: [:disc_name, :_destroy, tunes_attributes: [:tune_name, :_destroy]])
  end
end
