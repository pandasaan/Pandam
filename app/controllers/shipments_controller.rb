class ShipmentsController < ApplicationController
  def create
    @shipments = Shipment.new(shipment_params)
    @shipments.save
    redirect_to '/shipments'

  end

  def index
    @shipments = Shipment.new

  end

  def edit
  end

  def update
  end

  def destroy

    private
    def shipment_params
      params.require(:shipment).permit(:shipment_name, :shipment_name_kana, :shipment_postal_code, :shipment_address)
    end
  end
end
