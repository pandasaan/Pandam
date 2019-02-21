class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @disc = @item.discs.build
    @tune = @disc.tunes.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    binding.pry
       redirect_to admin_items_path
    else
       render :new
    end

  def index
    # 一覧は複数形の方がいいので@item → @itemsに変更しました
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
    @disc = @item.discs.find(params[:id])
    @tune = @disc.tunes.find(params[:id])
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
