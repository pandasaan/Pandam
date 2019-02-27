class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
    @disc = @item.discs.build
    @tune = @disc.tunes.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to admin_items_path
    else
       render :new
    end
  end

  def index
    # 一覧は複数形の方がいいので@item → @itemsに変更しました
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
  end

  def update
      item = Item.find(params[:id])
    if item.update_attributes(item_params)
      flash[:notice] = "編集が完了しました！"
      redirect_to admin_items_path
    else
      render "edit"
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_items_path
  end

  def flg_update
   @item = Item.find(params[:id])
   # @orders = @item.orders
  if @item.item_is_deleted == "active"
    @item.update_column(:item_is_deleted, 1)
    redirect_to admin_item_path(@item.id)
  else
    flash[:notice] = "すでに削除済の商品です！"
    render "show"
  end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :stock, :artist_id, :label_id, :genre_id, :item_is_deleted, discs_attributes: [:id, :disc_name, :_destroy, tunes_attributes: [:id, :tune_name, :index, :_destroy]])
  end
  def flg_params
    params.require(:item).permit(:item_is_deleted)
  end
end
