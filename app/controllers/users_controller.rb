class UsersController < ApplicationController
  include ConfirmationSender
  include CodeGenerator

  before_action :set_category

  def sign_up_menu
    
  end

  def phone_registration
  end

  def phone_confirmation
    if current_user.update(phone: params[:user][:phone])
      ConfirmationSender.send_confirmation_to(current_user)
    else
      render :phone_registration
    end
  end

  def phone_authenticated
    if current_user.verification_code == params[:verification_code]
      current_user.update(authenticated: true)
    else
      render :phone_registration
    end
  end

  def complete_registration
  end

  def index
  end

  def show
  end

  def information
    @address = current_user.addresses.first()
  end

  def information_update
    
  end

  def logout
  end

  def payment
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_ea08d8eb3daefb829e554156"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def profile
  end

  private
  def set_category
    @categories = Category.eager_load(children: :children).where(ancestry: nil)
  end
end
