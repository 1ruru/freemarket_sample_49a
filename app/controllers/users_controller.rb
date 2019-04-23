class UsersController < ApplicationController
  include ConfirmationSender
  include CodeGenerator

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
end
