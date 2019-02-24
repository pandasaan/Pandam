class Admin::ShipmentsController < ApplicationController
  def create
  end

  def index
    user = User.find(params[:id])
    @shipments = Shipment.all
  end

  def edit
    @shipments = Shipment.find(params[:id])
  end

  def update
    @shipments = Shipment.find(params[:id])
    @shipments.update(shipment_params)
    redirect_to user_path(user.id)
  end

  def destroy
    shipments = Shipment.find(params[:id])
    shipments.destroy
    redirect_to user_shipments_path
  end

    private
    def shipment_params
      params.require(:shipment).permit(:shipment_name, :shipment_name_kana, :shipment_postal_code, :shipment_address)
    end
end