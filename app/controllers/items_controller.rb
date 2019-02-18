class ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def index
  end

  def show
  	
  end
end
