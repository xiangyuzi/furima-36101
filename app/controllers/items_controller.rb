class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(id: 'DESC')
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :detail, :category_id, :condition_id, :handling_payer_id, :prefecture_id, :lead_time_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless @item.user.id == current_user.id && @item.purchase.blank?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
