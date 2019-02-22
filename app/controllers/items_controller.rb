class ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @discs = Disc.where(item_id: @item.id])
    @tunes = Tune.where(disc_id: @discs.id])
  end
end
