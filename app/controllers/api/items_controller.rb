class Api::ItemsController < ApplicationController
  def new
    if(params[:select_item_0].present?)
      @midCategories = Category.where(ancestry: params[:select_item_0])
    end
    if(params[:select_item_0].present? && params[:select_item_1].present?)
      @smallCategories = Category.where(ancestry: "#{params[:select_item_0]}/#{params[:select_item_1]}")
    end
  end
end