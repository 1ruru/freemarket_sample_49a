class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :search, :sign_up_menu]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, :birthday, :phone, :verification_code])
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "exp49" && password == "6517"
    end
  end
end
