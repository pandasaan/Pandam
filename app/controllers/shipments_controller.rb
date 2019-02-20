class ShipmentsController < ApplicationController
  def create
    @shipments = Shipment.new(shipment_params)
    @shipments.user_id = current_user.id
    @shipments.save
    redirect_to '/shipments'

  end

  def index
    @shipments = Shipment.new
    @shipment = Shipment.all

  end

  def edit
    @shipments = Shipment.find(params[:id])
  end

  def update
    @shipments = Shipment.find(params[:id])
    @shipments.update(shipment_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @shipments = Shipment.find(params[:id])
    @shipments.destroy
    redirect_to user_path
  end

    private
    def shipment_params
      params.require(:shipment).permit(:shipment_name, :shipment_name_kana, :shipment_postal_code, :shipment_address)
    end
end
