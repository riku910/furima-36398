class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :purchase_root, only: [:index]
  before_action :item_params, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def purchase_root
    item_params
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def item_params
    @item = Item.find(params[:item_id])
  end
end