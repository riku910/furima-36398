class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :detail, :price, :category_id, :status_id, :shipping_price_id, :prefecture_id, :shipping_day_id, :user).merge(user_id: current_user.id)
  end
end
