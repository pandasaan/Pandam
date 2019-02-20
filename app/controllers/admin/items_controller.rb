class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @disc = @item.discs.build
    @tune = @disc.tunes.build
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
    params.require(:item).permit(:image, :title, :price, :stock, :artist_id, :label_id, :genre_id, disc_attributes: [:id, :disc_name], tune_attributes: [:id, :tune_name])
  end
end
