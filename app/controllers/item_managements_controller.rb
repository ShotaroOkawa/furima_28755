class ItemManagementsController < ApplicationController
  before_action :move_to_index, only: [:index, :create] 
  before_action :move_to_index2, only: [:index, :create] 

  def index
    @item = Item.find(params[:item_id])
    @item_management = ItemManagement.new
    @item_management_address = ItemManagementAddress.new
  end

  def create
    binding.pry
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
    params.require(:item_management_address).permit(:price, :token, :zip_code, :prefecture_id, :city, :lot_number, :building_name, :telephone).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: item_management_address_params[:price],
      card: item_management_address_params[:token], 
      currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
  
  def move_to_index2
    @item = Item.find(params[:item_id])
    if ItemManagement.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
