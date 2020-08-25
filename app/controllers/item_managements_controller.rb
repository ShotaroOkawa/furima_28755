class ItemManagementsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_management = ItemManagement.new(item_id: item_management_params[:item_id], user_id: current_user.id)
    if @item_management.valid?
      pay_item
      @item_management.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def item_management_params
    params.permit(:price, :token, :item_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: item_management_params[:price],
      card: item_management_params[:token], 
      currency:'jpy'
    )
  end
end
