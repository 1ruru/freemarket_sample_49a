class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(4)
  end

  def new
    @item =Item.new
  end

  def create
    binding.pry
    @item=Item.new(item_params)
    # if params[:images].present?
    #   if @item.save
    #     if image_params.each { |image| @image = @item.images.create(image: image)}
    #       redirect_to root_path
    #     else
    #       render :new
    #     end
    #   end
    # else
    #   render :new
    # end
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

  def purchase
  end

  private

  def set_search
    @search = Item.ransack(params[:q])
  end

  def item_params
    params.require(:item).permit(:name ,:description ,:category_id ,:status ,:price, :state, :shipping_agency, :duration, images: []).merge(user_id: current_user.id)
  end
end