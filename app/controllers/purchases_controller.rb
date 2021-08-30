class PurchasesController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :street, :building_name, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay
    Payjp.api_key = ""
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end