class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_params_id, only: [:show, :edit, :update, :destroy]
  before_action :before_edit, only: [:edit]
  before_action :item_edit, only: [:edit]
  
  def index
    @item = Item.all.order("created_at DESC")
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :detail, :price, :category_id, :status_id, :shipping_price_id, :prefecture_id, :shipping_day_id, :user).merge(user_id: current_user.id)
  end

  def before_edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def item_params_id
    @item = Item.find(params[:id])
  end

  def item_edit
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
