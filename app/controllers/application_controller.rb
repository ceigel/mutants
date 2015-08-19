class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    back = session[:return_to] || request.referer
    redirect_to back || root_url, :alert => exception.message
  end

  alias_method :current_user, :current_mutant
  helper_method :current_user
  private
    def configure_devise_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
    end
end
