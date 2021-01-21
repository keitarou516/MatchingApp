class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys:[:company_key])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:company_key])
      devise_parameter_sanitizer.permit(:account_update, keys:[:company_key])
  end
end
