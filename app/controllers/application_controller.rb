class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name 
  	devise_parameter_sanitizer.for(:sign_up) << :phone_number
  end

  # this is to overwrite the devise default for redirect path after sign in
  def after_sign_in_path_for(resource)
  	stored_location_for(resource) || root_url
  end
end
