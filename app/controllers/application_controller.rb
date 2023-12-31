class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  # Configure permitted parameters for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :avatar])
  end
end
