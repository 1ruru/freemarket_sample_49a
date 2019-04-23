class AddressesController < ApplicationController
  #before_actionで承認ユーザー以外は戻す

  def new
    @address = Address.new(family_name: current_user.family_name, first_name: current_user.first_name, family_name_kana: current_user.family_name_kana, first_name_kana: current_user.first_name_kana)
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to new_user_payment_path(current_user)
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :house, :building, :phone).merge(user_id: current_user.id)
  end
end
