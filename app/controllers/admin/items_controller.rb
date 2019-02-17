class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.artist_id = 1
  	@item.label_id = 1
  	@item.genre_id = 1
    @item.save
    redirect_to admin_items_path
  end

  def index
  	@item = Item.all
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
    params.require(:item).permit(:image, :title)
  end
end


# , artist_attributes: [:id, :artist_name, :comment], label_attributes: [:id, :label], genre_attributes: [:id, :genre]