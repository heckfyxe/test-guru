class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.is_a? Admin
      admin_tests_path
    else
      stored_location_for(resource) || tests_path
    end
  end
end
