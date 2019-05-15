class ItemsController < ApplicationController
  before_action :set_item, only: [:index,:new, :show]

  def index
    @items = Item.all.limit(4)
    @mens = Item.where(Category_id: 2).limit(4).where(sold_out: 0)
    @ladies = Item.where(Category_id: 1).limit(4).where(sold_out: 0)
    @cosmes = Item.where(Category_id: 7).limit(4).where(sold_out: 0)
    @kids = Item.where(Category_id: 3).limit(4).where(sold_out: 0)
    
  end

    def test
    end

  def new
    @item =Item.new
    
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
    #   endp
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
    @item = Item.find(params[:id])
    @items = Item.new
    
  end

  


  private

  def set_search
    @search = Item.ransack(params[:q])
  end

  def item_params
    params.require(:item).permit(:name ,:description ,:category_id ,:status ,:price, :state, :shipping_agency, :duration).merge(user_id: current_user.id)
  end

  def set_item
    @categories = Category.eager_load(children: :children).where(ancestry: nil)
  end
end