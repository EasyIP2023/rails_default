class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied: #{exception.message}"
    redirect_to root_path
  end

  rescue_from ActiveRecord::RecordNotFound do |execption|
    flash[:error] = "Error 404: File Not Found"
    redirect_to root_path
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :first_name, :phone]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # added_attrs += [role_ids: []] # if current_user && current_user.admin?
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
