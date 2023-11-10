class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index] # ログインユーザーのみアクセス可

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile])
  end

  def after_sign_in_path_for(resource)
    user_path(resource) 
  end
end
