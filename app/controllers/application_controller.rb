class ApplicationController < ActionController::Base
  # この2行は開発中はコメントアウト
  # before_action :authenticate_customer!,except: [:top,:about]
  # before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def after_sign_in_path_for(resource)
    customer_path(resource)
  end


  private
  # def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
