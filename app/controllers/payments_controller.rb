class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    card = Card.where(user_id: current_user.id)
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to complete_registration_users_path()
    else
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:number, :cvc, :expiration_date).merge(user_id: current_user.id)
  end
end
