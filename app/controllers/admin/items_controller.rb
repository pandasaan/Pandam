class Admin::ItemsController < ApplicationController
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
    if item.update(item_params)
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
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :stock, :artist_id, :label_id, :genre_id, discs_attributes: [:disc_name, :_destroy, tunes_attributes: [:tune_name, :_destroy]])
  end
end
