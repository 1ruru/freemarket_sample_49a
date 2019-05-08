class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(4)
  end

  def new
    @item =Item.new
    # @categories = Category.all.order("id ASC").limit(13)
  end

  def create
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
  def item_params
    params.require(:item).permit(:name ,:description ,:category_id ,:status ,:price, :state, :shipping_agency, :duration).merge(user_id: current_user.id)
  end
end

# size　サイズ1
# responsibillity　責任？
# delivery_method　配達方法
# profit　利益
# draft　下書き
# sold_out
