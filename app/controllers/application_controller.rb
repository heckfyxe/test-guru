class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a? Admin
        admin_tests_path
      else
        tests_path
      end
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[first_name last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
