class ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def show
  end
end
