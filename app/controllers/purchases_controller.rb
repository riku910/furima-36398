class PurchasesController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

end
