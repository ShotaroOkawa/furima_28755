class ItemManagementsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_management = ItemManagement.new
    # @item_management_address = ItemManagementAddress.new(item_management_address_params)
  end

  def create
    @item_management_address = ItemManagementAddress.new(item_management_address_params)
    if @item_management_address.valid?
      pay_item
      @item_management_address.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def item_management_address_params
    params.permit(:price, :token, :item_id, :zip_code, :prefecture_id, :city, :lot_number, :building_name, :telephone ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: item_management_address_params[:price],
      card: item_management_address_params[:token], 
      currency:'jpy'
    )
  end
end
