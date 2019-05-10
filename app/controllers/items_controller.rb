class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(4)
  end

  def new
    @item =Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
<<<<<<< HEAD
    @userItems = @item.user.items
    @cateItems = Item.where("category_id = #{@item.category.id}").limit(3)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    binding.pry
    @item = Item.find(params[:id])

    if(params[:item][:del_image_ids])
      params[:item][:del_image_ids].each do |del_image_id|
        image = @item.images.find(del_image_id)
        image.purge
      end
    end
    if @item.update!(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy!()
      redirect_to root_path
    else
      render :edit
    end
=======
>>>>>>> origin/master
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