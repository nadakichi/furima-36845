class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :authenticate_user!, only: [:new, :edit, :update]


  def index
    @items = Item.order('created_at DESC')
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
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id,
                                 :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
